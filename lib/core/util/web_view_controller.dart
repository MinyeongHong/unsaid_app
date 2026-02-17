import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewController {
  final void Function() onPageFinished;
  final String url;

  CustomWebViewController({
    required this.onPageFinished,
    required this.url,
  });

  WebViewController get init => WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (_) {
          this.onPageFinished();
        },
      ),
    )
    ..loadRequest(Uri.parse(this.url));
}
