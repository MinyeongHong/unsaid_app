part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failure() = _Failure;
  const factory AuthState.success() = _Success;
}
