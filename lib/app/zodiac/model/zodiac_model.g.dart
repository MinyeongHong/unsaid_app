// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodiac_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Zodiac _$ZodiacFromJson(Map<String, dynamic> json) => _Zodiac(
  (json['id'] as num).toInt(),
  json['name'] as String,
  (json['zodiac_shadows'] as List<dynamic>)
      .map((e) => ZodiacShadow.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ZodiacToJson(_Zodiac instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'zodiac_shadows': instance.zodiacShadows,
};

_ZodiacShadow _$ZodiacShadowFromJson(Map<String, dynamic> json) =>
    _ZodiacShadow(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ZodiacShadowToJson(_ZodiacShadow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
