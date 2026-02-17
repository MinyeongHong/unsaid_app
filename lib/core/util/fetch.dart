import 'dart:convert';
import 'package:http/http.dart';
import 'package:unsaid_app/core/util/config.dart';
import 'package:unsaid_app/core/util/env.dart';
import 'package:unsaid_app/core/util/firebase.dart';

class FetchState {
  int offset;
  int limit;
  bool isLoading;

  FetchState({
    this.offset = 0,
    this.limit = 20,
    this.isLoading = false,
  });
}

final Client _client = Client();

Future<dynamic> fetchData({
  required String method,
  required String path,
  String headerType = 'auth',
  String? authorization,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? body,
}) async {
  try {
    final String env = Config.env;

    final String apiUrl = env == 'prod' ? Env.apiProdUrl : Env.apiDevUrl;

    // CHANGED: authorization 여부로 URL을 바꾸지 않고,
    // path가 absolute URL인지로 판단해서 url을 결정
    final bool isAbsolute = path.startsWith('http://') || path.startsWith('https://'); // ADDED
    final String url = isAbsolute ? path : '$apiUrl/$path'; // CHANGED

    Uri uri = Uri.parse(url);

    if (queryParameters != null && queryParameters.isNotEmpty) {
      final qp = queryParameters.map((k, v) => MapEntry(k, v.toString()));

      uri = uri.replace(
        queryParameters: qp,
      );
    }

    final Request request = Request(
      method,
      uri,
    );

    if (authorization != null) {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': authorization,
      });
    } else if (headerType == 'auth') {
      final String? idToken = await firebaseAuth.currentUser!.getIdToken();

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      });
    }

    if (body != null) {
      request.body = jsonEncode(body);
    }

    // ✅ 재사용 client로 요청
    final StreamedResponse streamed = await _client.send(request);

    // ✅ 편하게 다루기 위해 Response로 변환
    final Response response = await Response.fromStream(streamed);

    // ✅ 빈 바디/비JSON 바디 방어
    dynamic responseBody;

    if (response.body.isEmpty) {
      responseBody = null;
    } else {
      try {
        responseBody = jsonDecode(response.body);
      } catch (_) {
        responseBody = response.body; // JSON 아니면 raw text
      }
    }

    // ✅ 성공 판정: 2xx 전체
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (authorization != null) {
        return responseBody;
      }

      // ✅ data 래핑이 없을 수도 있으니 안전하게
      if (responseBody is Map && responseBody.containsKey('data')) {
        return responseBody['data'];
      }

      return responseBody;
    }

    // ✅ 에러는 status 포함해서 던지면 디버깅 쉬움
    // CHANGED: meta에 method/url 추가해서 어디 요청이 터졌는지 바로 보이게
    throw {
      // CHANGED
      'status': response.statusCode,
      'error': responseBody,
      'meta': {
        // ADDED
        'method': method,
        'url': uri.toString(),
      },
    };
  } catch (e) {
    throw e;
  }
}

String decodeJwtPayload(String jwt) {
  final parts = jwt.split('.');
  if (parts.length != 3) return 'not jwt';
  final payload = parts[1];
  final normalized = base64Url.normalize(payload);
  return utf8.decode(base64Url.decode(normalized));
}
