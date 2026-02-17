import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unsaid_app/app.dart';
import 'package:unsaid_app/app/reading/bloc/reading_bloc.dart';
import 'package:unsaid_app/app/user_setting/bloc/user_setting_bloc.dart';
import 'package:unsaid_app/core/app_lifecycle/app_lifecycle_bloc.dart';
import 'package:unsaid_app/core/app_state/bloc/app_state_bloc.dart';
import 'package:unsaid_app/core/auth/bloc/auth_bloc.dart';
import 'package:unsaid_app/core/route/bloc/route_bloc.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/config.dart';
import 'package:unsaid_app/core/util/env.dart';
import 'package:unsaid_app/core/util/log.dart';

void main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await _initMain();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc()..add(AuthEvent.appStart()),
        ),
        BlocProvider<RouteBloc>(
          create: (context) => RouteBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            context: context,
          )..add(RouteEvent.fetch()),
        ),
        BlocProvider<AppLifecycleBloc>(
          create: (context) => AppLifecycleBloc(),
        ),
        BlocProvider<AppStateBloc>(
          create: (_) => AppStateBloc()..add(AppStateEvent.fetch()),
        ),
        BlocProvider<UserBloc>(
          create: (_) => UserBloc()..add(UserEvent.fetch()),
        ),
        BlocProvider<UserSettingBloc>(
          create: (_) => UserSettingBloc()..add(UserSettingEvent.fetch()),
        ),
        BlocProvider<ReadingBloc>(
          create: (_) => ReadingBloc()..add(ReadingEvent.fetch()),
        ),
      ],
      child: App(),
    ),
  );
}

Future<void> _initMain() async {
  try {
    analyticsLogEvent('splash_open');

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );

    await Firebase.initializeApp();

    await setAnalyticsUserId();

    await Config.init();
    await Env.init();

    final Directory directory = await getApplicationDocumentsDirectory();

    Hive.init(directory.path);

    await Hive.openBox('unsaid');

    if (kReleaseMode) {
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    }

    analyticsLogEvent('splash_open');
  } catch (e) {
    errorLog('_initMain', e);
  }
}
