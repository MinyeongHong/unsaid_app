// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reading _$ReadingFromJson(Map<String, dynamic> json) => _Reading(
  json['id'] as String,
  DateTime.parse(json['created_at'] as String),
  DateTime.parse(json['updated_at'] as String),
  json['uid'] as String,
  json['question'] as String,
  json['interpretation'] as String?,
  json['unsaid_line'] as String,
);

Map<String, dynamic> _$ReadingToJson(_Reading instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'uid': instance.uid,
  'question': instance.question,
  'interpretation': instance.interpretation,
  'unsaid_line': instance.unsaidLine,
};
