import 'package:unsaid_app/core/util/flavor.dart';

class Config {
  late String envByFlavor;

  static final Config _instance = Config._internal();
  factory Config() => _instance;

  Config._internal();

  static String env = Config().envByFlavor;

  static Future<void> init() async {
    try {
      final String flavor = await getFlavor();

      Config config = Config();

      config.envByFlavor = flavor;
    } catch (e) {
      throw e;
    }
  }
}
