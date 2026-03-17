import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app.dart';
import 'package:unsaid_app/app/home/home_page.dart';
import 'package:unsaid_app/app/sign/page/sign_agree_page.dart';
import 'package:unsaid_app/app/sign/page/sign_page.dart';
import 'package:unsaid_app/app/zodiac/page/zodiac_page.dart';
import 'package:unsaid_app/core/auth/bloc/auth_bloc.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'route_bloc.freezed.dart';
part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final AuthBloc authBloc;
  final BuildContext context;

  RouteBloc({
    required this.authBloc,
    required this.context,
  }) : super(RouteState.loading()) {
    on<_Fetch>(_fetch);
    on<_Add>(_add);
    on<_Delete>(_delete);
    on<_Reset>(_reset);
  }

  void _fetch(_, emit) async {
    try {
      late PageData pageData;

      if (authBloc.state == AuthState.failure()) {
        pageData = PageData(
          page: SignPage(),
        );
      } else if (authBloc.state == AuthState.success()) {
        final User user = await UserBloc.getUserByRepository();

        if (!user.isAgreed) {
          pageData = PageData(
            page: SignAgreePage(
              hasAppBar: false,
            ),
          );
        } else if (!user.isBirthCompleted) {
          pageData = PageData(
            page: ZodiacPage(
              hasAppBar: false,
            ),
          );
        } else {
          pageData = PageData(
            page: HomePage(),
          );
        }
      }

      final RouteData routeData = RouteData(
        pages: [
          pageData.getPage(),
        ],
      );

      emit(RouteState.success(routeData));

      FlutterNativeSplash.remove();

      _analyticsLogEvent(pageData);

      routeLog(pageData.getPath());
    } catch (e) {
      errorLog('RouteBloc', e);
    }
  }

  void _add(_Add _add, emit) {
    try {
      final currentState = state;

      if (currentState is _Success) {
        final String currentPath = RouteData.getPath(
          currentState.routeData.pages.last.key.toString(),
        );

        final String addPath = _add.pageData.getPath();
        final String newPath = currentPath + addPath;

        if (currentPath.split('/').last == newPath.split('/').last) return;

        currentState.routeData.pages.add(
          _add.pageData.getPage(
            path: newPath,
          ),
        );

        emit(RouteState.loading());
        emit(RouteState.success(currentState.routeData));

        _analyticsLogEvent(_add.pageData);

        routeLog(newPath);
      }
    } catch (e) {
      errorLog('RouteBloc', e);
    }
  }

  void _delete(_Delete _delete, emit) {
    try {
      final currentState = state;

      if (currentState is _Success) {
        currentState.routeData.pages.removeWhere(
          (page) => page.key == _delete.page.key,
        );

        emit(RouteState.loading());
        emit(RouteState.success(currentState.routeData));

        final String currentPath = RouteData.getPath(
          currentState.routeData.pages.last.key.toString(),
        );

        routeLog(currentPath);
      }
    } catch (e) {
      errorLog('RouteBloc', e);
    }
  }

  void _reset(_Reset _reset, emit) {
    try {
      final RouteData routeData = RouteData(
        pages: [
          _reset.pageData.getPage(),
        ],
      );

      emit(RouteState.loading());
      emit(RouteState.success(routeData));

      _analyticsLogEvent(_reset.pageData);

      routeLog(_reset.pageData.getPath());
    } catch (e) {
      errorLog('RouteBloc', e);
    }
  }

  void _analyticsLogEvent(PageData pageData) {
    final String splitPath = pageData.getPath().split('/').last;

    final String analyticsName = splitPath + '_open';

    final List<String> exceptNames = [];

    if (exceptNames.contains(analyticsName)) return;

    analyticsLogEvent(analyticsName);
  }
}

class CustomRouteBloc extends StatelessWidget {
  final bool Function(Route<dynamic>, dynamic) onPopPage;

  const CustomRouteBloc({
    Key? key,
    required this.onPopPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteBloc, RouteState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return Scaffold();
          },
          success: (RouteData routeData) {
            return HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: Navigator(
                key: CustomNavigator.key,
                pages: routeData.getPages(),
                onPopPage: (Route<dynamic> route, dynamic result) {
                  return onPopPage(route, result);
                },
              ),
            );
          },
        );
      },
    );
  }
}
