// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  (json['id'] as num).toInt(),
  json['language'] as String,
  json['ios_app_version'] as String,
  json['android_app_version'] as String,
  json['update_title'] as String,
  json['maintenance_title'] as String,
  json['maintenance_start_at'] == null
      ? null
      : DateTime.parse(json['maintenance_start_at'] as String),
  json['maintenance_end_at'] == null
      ? null
      : DateTime.parse(json['maintenance_end_at'] as String),
  json['packageInfoVersion'] as String? ?? '1.0.0',
  json['hasDialog'] as bool? ?? false,
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'id': instance.id,
  'language': instance.language,
  'ios_app_version': instance.iosAppVersion,
  'android_app_version': instance.androidAppVersion,
  'update_title': instance.updateTitle,
  'maintenance_title': instance.maintenanceTitle,
  'maintenance_start_at': instance.maintenanceStartAt?.toIso8601String(),
  'maintenance_end_at': instance.maintenanceEndAt?.toIso8601String(),
  'packageInfoVersion': instance.packageInfoVersion,
  'hasDialog': instance.hasDialog,
};
