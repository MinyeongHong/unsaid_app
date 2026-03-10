import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unsaid_app/core/app_state/bloc/app_state_bloc.dart';
import 'package:unsaid_app/core/auth/bloc/auth_bloc.dart';
import 'package:unsaid_app/core/route/bloc/route_bloc.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    // FlutterAppBadger.removeBadge();

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //  FlutterAppBadger.removeBadge();

      BlocProvider.of<AppStateBloc>(context).add(
        AppStateEvent.fetch(),
      );
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: CustomThemeData.init.copyWith(
        extensions: [
          FlashBarTheme(
            padding: EdgeInsets.all(20),
            backgroundColor: CustomColor.gray080,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
      localizationsDelegates: [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //   supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: CustomRouterDelegate(),
      routeInformationParser: CustomRouteInformationParser(),
    );
  }
}

class CustomNavigator {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static BuildContext get context {
    final context = key.currentContext;
    if (context == null) {
      throw FlutterError('CustomNavigator.context is null.');
    }
    return context;
  }

  static NavigatorState get navigator {
    final navigator = key.currentState;
    if (navigator == null) {
      throw FlutterError('CustomNavigator.navigator is null.');
    }
    return navigator;
  }
}

class CustomRouterDelegate extends RouterDelegate<Object>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => CustomNavigator.key;

  bool onPopPage({
    required Route<dynamic> route,
    required dynamic result,
  }) {
    if (!route.didPop(result)) {
      return false;
    }

    final Page page = route.settings as Page;

    deleteRoute(page);

    return true;
  }

  @override
  Future<void> setNewRoutePath(Object page) async {}

  @override
  Widget build(BuildContext context) {
    return CustomAuthBloc(
      listenerOrElse: () {},
      orElse: () {
        return CustomRouteBloc(
          onPopPage: (Route<dynamic> route, dynamic result) {
            return onPopPage(
              route: route,
              result: result,
            );
          },
        );
      },
    );
  }
}

class CustomRouteInformationParser extends RouteInformationParser<Object> {
  @override
  Future<Object> parseRouteInformation(RouteInformation routeInformation) async {
    return MaterialPage(
      key: ValueKey(''),
      child: Scaffold(),
    );
  }

  @override
  RouteInformation restoreRouteInformation(Object page) {
    return RouteInformation();
  }
}
