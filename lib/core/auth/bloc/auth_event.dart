part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStart() = _AppStart;
  const factory AuthEvent.signIn() = _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
