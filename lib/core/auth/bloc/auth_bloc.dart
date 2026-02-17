import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app/sign/page/sign_page.dart';
import 'package:unsaid_app/core/auth/repository/auth_repository.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/firebase.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthRepository _authRepository = AuthRepositoryImpl();

  AuthBloc() : super(AuthState.loading()) {
    on<_AppStart>(_appStart);
    on<_SignIn>(_signIn);
    on<_SignOut>(_signOut);
  }

  void _appStart(_, emit) {
    try {
      if (currentUid != null) {
        emit(AuthState.success());
      } else {
        emit(AuthState.failure());
      }
    } catch (e) {
      errorLog('AuthBloc', e);
    }
  }

  void _signIn(_, emit) async {
    try {
      if (currentUid != null) {
        final UserState userState = BlocProvider.of<UserBloc>(context).state;

        bool isSuccess = false;

        userState.whenOrNull(
          success: (_) {
            isSuccess = true;
          },
        );

        if (isSuccess) {
          BlocProvider.of<UserBloc>(context).add(
            UserEvent.fetch(),
          );
        }
      }

      emit(AuthState.loading());
      emit(AuthState.success());
    } catch (e) {
      emit(AuthState.loading());
      emit(AuthState.success());

      errorLog('AuthBloc', e);
    }
  }

  void _signOut(_, emit) async {
    try {
      await firebaseAuth.signOut();

      resetRoute(
        page: SignPage(),
      );

      emit(AuthState.loading());
      emit(AuthState.failure());
    } catch (e) {
      errorLog('AuthBloc', e);
    }
  }

  static Future<UserCredential> signApple() async {
    final either = await _authRepository.signApple();

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<UserCredential> signGoogle() async {
    final either = await _authRepository.signGoogle();

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}

class CustomAuthBloc extends StatelessWidget {
  final void Function() listenerOrElse;
  final Widget Function() orElse;

  const CustomAuthBloc({
    super.key,
    required this.listenerOrElse,
    required this.orElse,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            listenerOrElse();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Scaffold();
          },
          orElse: () {
            return orElse();
          },
        );
      },
    );
  }
}
