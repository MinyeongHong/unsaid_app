part of 'reading_bloc.dart';

@freezed
class ReadingState with _$ReadingState {
  const factory ReadingState.loading() = _Loading;
  const factory ReadingState.failure(Failure failure) = _Failure;
  const factory ReadingState.success(List<Reading> readings) = _Success;
}
