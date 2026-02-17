part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.fetch() = _Fetch;
  const factory UserEvent.update(User user) = _Update;
}
