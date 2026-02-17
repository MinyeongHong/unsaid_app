part of 'route_bloc.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState.loading() = _Loading;
  const factory RouteState.success(RouteData routeData) = _Success;
}
