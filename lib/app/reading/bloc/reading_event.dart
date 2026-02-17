part of 'reading_bloc.dart';

@freezed
class ReadingEvent with _$ReadingEvent {
  const factory ReadingEvent.fetch() = _Fetch;
  const factory ReadingEvent.add(Reading reading) = _Add;
  const factory ReadingEvent.delete(String id) = _Delete;
}
