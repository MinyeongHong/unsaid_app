import 'package:freezed_annotation/freezed_annotation.dart';

part 'zodiac_model.freezed.dart';
part 'zodiac_model.g.dart';

@freezed
abstract class Zodiac with _$Zodiac {
  const Zodiac._();
  const factory Zodiac(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'zodiac_shadows') List<ZodiacShadow> zodiacShadows,
  ) = _Zodiac;

  factory Zodiac.fromJson(Map<String, dynamic> json) => _$ZodiacFromJson(json);
}

@freezed
abstract class ZodiacShadow with _$ZodiacShadow {
  const ZodiacShadow._();
  const factory ZodiacShadow(
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'description') String description,
  ) = _ZodiacShadow;

  factory ZodiacShadow.fromJson(Map<String, dynamic> json) => _$ZodiacShadowFromJson(json);
}

class ZodiacAdd {
  String? name;
  String? shadowId;

  ZodiacAdd({
    this.name,
    this.shadowId,
  });
}
