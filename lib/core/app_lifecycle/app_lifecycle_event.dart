part of 'app_lifecycle_bloc.dart';

@freezed
abstract class AppLifecycleEvent with _$AppLifecycleEvent {
  const factory AppLifecycleEvent.fetch(String state) = _Fetch;
}
