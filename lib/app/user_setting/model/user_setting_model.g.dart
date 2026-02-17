// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSetting _$UserSettingFromJson(Map<String, dynamic> json) => _UserSetting(
  json['uid'] as String,
  DateTime.parse(json['created_at'] as String),
  DateTime.parse(json['updated_at'] as String),
  json['is_marketing'] as bool,
);

Map<String, dynamic> _$UserSettingToJson(_UserSetting instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_marketing': instance.isMarketing,
    };
