import 'package:flutter/services.dart';
import 'package:unsaid_app/core/widget/toast.dart';
import 'package:url_launcher/url_launcher.dart';

void copyText({
  required String text,
  required String title,
}) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text: text,
      ),
    );

    customToast(title);
  } catch (e) {
    errorToast(e);
  }
}

void customLaunchUrl({
  required String url,
  LaunchMode? launchMode,
}) async {
  try {
    final Uri uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: launchMode ?? LaunchMode.platformDefault,
    );
  } catch (e) {
    errorToast(e);
  }
}

// Future<void> customShare({
//   required String type,
//   required String title,
//   String? image,
//   Uint8List? uint8list,
// }) async {
//   try {
//     late ByteData byteData;

//     if (image != null) {
//       if (image.startsWith('assets')) {
//         byteData = await rootBundle.load(image);
//       } else {
//         final Response response = await get(
//           Uri.parse(image),
//         );

//         final ByteBuffer byteBuffer = response.bodyBytes.buffer;

//         byteData = ByteData.view(byteBuffer);
//       }
//     }

//     final Directory directory = await getTemporaryDirectory();

//     final String fileName = nowDate.microsecondsSinceEpoch.toString();

//     File file = File('${directory.path}/$fileName.png');

//     if (uint8list != null) {
//       await file.writeAsBytes(uint8list);
//     } else {
//       await file.writeAsBytes(byteData.buffer.asUint8List());
//     }

//     final XFile xFile = XFile(file.path);

//     final String encryptedText = getEncryptedText(type);

//     final String linkUrl = 'https://test-app.github.io/$encryptedText';

//     await Share.shareXFiles(
//       [xFile],
//       text: '$title\n\n$linkUrl',
//     );
//   } catch (e) {
//     throw e;
//   }
// }
