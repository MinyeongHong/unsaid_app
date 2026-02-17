part of 'user_setting_bloc.dart';

@freezed
class UserSettingEvent with _$UserSettingEvent {
  const factory UserSettingEvent.fetch() = _Fetch;
  const factory UserSettingEvent.update(UserSetting userSetting) = _Update;
}
