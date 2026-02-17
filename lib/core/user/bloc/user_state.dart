part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.failure(Failure failure) = _Failure;
  const factory UserState.success(User user) = _Success;
}
