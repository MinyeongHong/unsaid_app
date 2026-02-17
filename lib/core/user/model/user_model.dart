import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const User._();
  const factory User(
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'uid') String uid,
    @JsonKey(name: 'state') String state,
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'provider') String provider,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'sun_sign') String? sunSign,
    @JsonKey(name: 'daily_question_count') int dailyQuestionCount,
    @JsonKey(name: 'is_agreed') bool isAgreed,
    @JsonKey(name: 'is_birth_completed') bool isBirthCompleted,
    @JsonKey(name: 'birth') DateTime? birth,
    @JsonKey(name: 'last_question_date') DateTime? lastQuestionDate,
    @JsonKey(name: 'latest_at') DateTime latestAt,
    @JsonKey(name: 'suspended_at') DateTime? suspendedAt,
    @JsonKey(name: 'blocked_at') DateTime? blockedAt,
    @JsonKey(name: 'withdrawal_at') DateTime? withdrawalAt,
  ) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

class UserAdd {
  String? uid;
  String? provider;
  String? email;

  UserAdd({
    this.uid,
    this.provider,
    this.email,
  });
}
