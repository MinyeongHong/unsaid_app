import 'package:flutter/services.dart';

Future<String> getFlavor() async {
  try {
    // TODO flavor
    //  return 'dev';

    final MethodChannel methodChannel = MethodChannel('flavor');

    final String flavor = await methodChannel.invokeMethod('');

    return flavor;
  } catch (e) {
    throw e;
  }
}
