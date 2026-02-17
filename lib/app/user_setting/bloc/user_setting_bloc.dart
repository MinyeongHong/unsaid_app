import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app/user_setting/model/user_setting_model.dart';
import 'package:unsaid_app/app/user_setting/repository/user_setting_repository.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/log.dart';

part 'user_setting_bloc.freezed.dart';
part 'user_setting_event.dart';
part 'user_setting_state.dart';

class UserSettingBloc extends Bloc<UserSettingEvent, UserSettingState> {
  static UserSettingRepository _userSettingRepository =
      UserSettingRepositoryImpl();

  UserSettingBloc() : super(UserSettingState.loading()) {
    on<_Fetch>(_fetch);
    on<_Update>(_update);
  }

  void _fetch(_, emit) async {
    final either = await _userSettingRepository.getUserSetting();

    either.fold(
      (l) {
        emit(UserSettingState.failure(l));
      },
      (r) {
        emit(UserSettingState.loading());
        emit(UserSettingState.success(r));
      },
    );
  }

  void _update(_Update _update, emit) {
    try {
      final currentState = state;

      if (currentState is _Success) {
        emit(UserSettingState.loading());
        emit(UserSettingState.success(_update.userSetting));
      }
    } catch (e) {
      errorLog('UserSettingBloc', e);
    }
  }

  static Future<void> updateUserSetting(UserSetting userSetting) async {
    final either = await _userSettingRepository.updateUserSetting(userSetting);

    either.fold((l) => throw l, (r) => r);
  }
}

class CustomUserSettingBloc extends StatelessWidget {
  final Widget Function(UserSetting) success;

  const CustomUserSettingBloc({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingBloc, UserSettingState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return Container();
          },
          failure: (_) {
            return Container();
          },
          success: (UserSetting userSetting) {
            return success(userSetting);
          },
        );
      },
    );
  }
}
