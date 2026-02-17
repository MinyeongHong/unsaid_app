part of 'user_setting_bloc.dart';

@freezed
class UserSettingState with _$UserSettingState {
  const factory UserSettingState.loading() = _Loading;
  const factory UserSettingState.failure(Failure failure) = _Failure;
  const factory UserSettingState.success(UserSetting userSetting) = _Success;
}
