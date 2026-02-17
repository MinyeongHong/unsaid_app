part of 'app_state_bloc.dart';

@freezed
class AppStateState with _$AppStateState {
  const factory AppStateState.loading() = _Loading;
  const factory AppStateState.failure(Failure failure) = _Failure;
  const factory AppStateState.success(AppState appState) = _Success;
}
