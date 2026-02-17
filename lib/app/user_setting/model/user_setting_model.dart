import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting_model.freezed.dart';
part 'user_setting_model.g.dart';

@freezed
abstract class UserSetting with _$UserSetting {
  const UserSetting._();
  const factory UserSetting(
    @JsonKey(name: 'uid') String uid,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'is_marketing') bool isMarketing,
  ) = _UserSetting;

  factory UserSetting.fromJson(Map<String, dynamic> json) => _$UserSettingFromJson(json);
}
