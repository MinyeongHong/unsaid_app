part of 'app_state_bloc.dart';

@freezed
class AppStateEvent with _$AppStateEvent {
  const factory AppStateEvent.fetch() = _Fetch;
  const factory AppStateEvent.update() = _Update;
}
