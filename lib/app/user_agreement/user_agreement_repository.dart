import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';

class UserAgreementRepository {
  static Future<void> addUserAgreement({required bool isMarketing}) async {
    try {
      await fetchData(
        method: 'post',
        path: 'user-agreements',
        headerType: 'auth',
        body: {
          'is_marketing': isMarketing,
          'policy_version': 'v1',
        },
      );
    } catch (e) {
      throw Failure('addUserAgreement', e);
    }
  }
}
