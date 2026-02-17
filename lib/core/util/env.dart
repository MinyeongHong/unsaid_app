import 'package:flutter/services.dart';

class Env {
  late String apiProdUrlByEnv;
  late String apiDevUrlByEnv;
  late String unsaidApiKeyByEnv;
  late String aesKeyByEnv;
  late String aesIvByEnv;

  static final Env _instance = Env._internal();
  factory Env() => _instance;

  Env._internal();

  static String apiProdUrl = Env().apiProdUrlByEnv;
  static String apiDevUrl = Env().apiDevUrlByEnv;
  static String unsaidApiKey = Env().unsaidApiKeyByEnv;
  static String aesKey = Env().aesKeyByEnv;
  static String aesIv = Env().aesIvByEnv;

  static Future<void> init() async {
    try {
      final String envString = await rootBundle.loadString('.env');

      final List<String> splitEnvStrings = envString.split('\n');

      Map<String, String> envs = {};

      splitEnvStrings.forEach((splitEnvString) {
        final String key = splitEnvString.split('=').first;
        final String value = splitEnvString.split('=').last;

        envs.addAll({key: value});
      });

      Env env = Env();

      env.apiProdUrlByEnv = envs['API_PROD_URL']!;
      env.apiDevUrlByEnv = envs['API_DEV_URL']!;
    } catch (e) {
      throw e;
    }
  }
}
