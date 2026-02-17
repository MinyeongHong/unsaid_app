import 'package:dartz/dartz.dart';
import 'package:unsaid_app/app/user_setting/model/user_setting_model.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';

abstract class UserSettingRepository {
  Future<Either<Failure, UserSetting>> getUserSetting();
  Future<Either<Failure, void>> updateUserSetting(UserSetting userSetting);
}

class UserSettingRepositoryImpl implements UserSettingRepository {
  @override
  Future<Either<Failure, UserSetting>> getUserSetting() async {
    try {
      final dynamic data = await fetchData(
        method: 'get',
        path: 'user-settings',
      );

      final UserSetting userSetting = UserSetting.fromJson(data);

      return Right(userSetting);
    } catch (e) {
      return Left(Failure('getUserSetting', e));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserSetting(UserSetting userSetting) async {
    try {
      await fetchData(
        method: 'put',
        path: 'user-settings',
        body: {
          'is_marketing': userSetting.isMarketing,
        },
      );

      return Right(null);
    } catch (e) {
      return Left(Failure('updateUserSetting', e));
    }
  }
}
