// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  json['id'] as String,
  DateTime.parse(json['created_at'] as String),
  DateTime.parse(json['updated_at'] as String),
  json['uid'] as String,
  json['state'] as String,
  json['role'] as String,
  json['provider'] as String,
  json['email'] as String,
  json['sun_sign'] as String?,
  (json['daily_question_count'] as num).toInt(),
  json['is_agreed'] as bool,
  json['is_birth_completed'] as bool,
  json['birth'] == null ? null : DateTime.parse(json['birth'] as String),
  json['last_question_date'] == null
      ? null
      : DateTime.parse(json['last_question_date'] as String),
  DateTime.parse(json['latest_at'] as String),
  json['suspended_at'] == null
      ? null
      : DateTime.parse(json['suspended_at'] as String),
  json['blocked_at'] == null
      ? null
      : DateTime.parse(json['blocked_at'] as String),
  json['withdrawal_at'] == null
      ? null
      : DateTime.parse(json['withdrawal_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'uid': instance.uid,
  'state': instance.state,
  'role': instance.role,
  'provider': instance.provider,
  'email': instance.email,
  'sun_sign': instance.sunSign,
  'daily_question_count': instance.dailyQuestionCount,
  'is_agreed': instance.isAgreed,
  'is_birth_completed': instance.isBirthCompleted,
  'birth': instance.birth?.toIso8601String(),
  'last_question_date': instance.lastQuestionDate?.toIso8601String(),
  'latest_at': instance.latestAt.toIso8601String(),
  'suspended_at': instance.suspendedAt?.toIso8601String(),
  'blocked_at': instance.blockedAt?.toIso8601String(),
  'withdrawal_at': instance.withdrawalAt?.toIso8601String(),
};
