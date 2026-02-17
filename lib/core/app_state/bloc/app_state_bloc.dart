import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:unsaid_app/core/app_state/model/app_state_model.dart';
import 'package:unsaid_app/core/app_state/repository/app_state_repository.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'app_state_bloc.freezed.dart';
part 'app_state_event.dart';
part 'app_state_state.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  static AppStateRepository _appStateRepository = AppStateRepositoryImpl();

  AppStateBloc() : super(AppStateState.loading()) {
    on<_Fetch>(_fetch);
    on<_Update>(_update);
  }

  void _fetch(_, emit) async {
    final either = await _appStateRepository.getAppState();

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    either.fold(
      (l) {
        emit(AppStateState.failure(l));
      },
      (AppState appState) {
        appState = appState.copyWith(
          packageInfoVersion: packageInfo.version,
        );

        emit(AppStateState.loading());
        emit(AppStateState.success(appState));
      },
    );
  }

  void _update(_, emit) {
    try {
      final currentState = state;

      if (currentState is _Success) {
        AppState appState = currentState.appState;

        appState = appState.copyWith(
          hasDialog: true,
        );

        emit(AppStateState.loading());
        emit(AppStateState.success(appState));
      }
    } catch (e) {
      errorLog('AppStateBloc', e);
    }
  }
}

class CustomAppStateBloc extends StatelessWidget {
  final Widget child;

  const CustomAppStateBloc({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppStateBloc, AppStateState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (AppState appState) {
            appState.addDialog();
          },
        );
      },
      child: child,
    );
  }
}
