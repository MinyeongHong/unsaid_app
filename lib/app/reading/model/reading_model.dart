import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_model.freezed.dart';
part 'reading_model.g.dart';

@freezed
abstract class Reading with _$Reading {
  const Reading._();
  const factory Reading(
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'uid') String uid,
    @JsonKey(name: 'question') String question,
    @JsonKey(name: 'interpretation') String? interpretation,
    @JsonKey(name: 'unsaid_line') String unsaidLine,
    // @JsonKey(name: 'card_id') String cardId,
    // @JsonKey(name: 'card_name') String cardName,
    // @JsonKey(name: 'orientation') String orientation, // 'upright' | 'reversed'
    // @JsonKey(name: 'prompt_version') String promptVersion,
  ) = _Reading;

  factory Reading.fromJson(Map<String, dynamic> json) => _$ReadingFromJson(json);
}
