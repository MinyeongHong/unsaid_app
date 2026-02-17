part of 'route_bloc.dart';

@freezed
class RouteEvent with _$RouteEvent {
  const factory RouteEvent.fetch() = _Fetch;
  const factory RouteEvent.add(PageData pageData) = _Add;
  const factory RouteEvent.delete(Page page) = _Delete;
  const factory RouteEvent.reset(PageData pageData) = _Reset;
}
