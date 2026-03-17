import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app/zodiac/model/zodiac_model.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/user/repository/user_repository.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/firebase.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/widget/shimmer.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  static UserRepository _userRepository = UserRepositoryImpl();

  UserBloc() : super(UserState.loading()) {
    on<_Fetch>(_fetch);
    on<_Update>(_update);
  }

  void _fetch(_, emit) async {
    final either = await _userRepository.getUser();

    either.fold(
      (l) {
        emit(UserState.failure(l));
      },
      (r) {
        emit(UserState.loading());
        emit(UserState.success(r));
      },
    );
  }

  void _update(_Update _update, emit) {
    try {
      final currentState = state;

      if (currentState is _Success) {
        emit(UserState.loading());
        emit(UserState.success(_update.user));
      }
    } catch (e) {
      errorLog('UserBloc', e);
    }
  }

  static User getUser() {
    try {
      final UserState userState = BlocProvider.of<UserBloc>(context).state;

      late User user;

      userState.whenOrNull(
        success: (User u) {
          user = u;
        },
      );

      return user;
    } catch (e) {
      throw e;
    }
  }

  static Future<User> getUserByRepository() async {
    final either = await _userRepository.getUser();

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<User> addUser(UserAdd userAdd) async {
    final either = await _userRepository.addUser(userAdd);

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<User> updateUserZodiac(ZodiacAdd zodiacAdd) async {
    final either = await _userRepository.updateUserZodiac(zodiacAdd);

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<User> updateUser(DateTime? birth) async {
    final either = await _userRepository.updateUser(birth);

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<void> deleteUser() async {
    final either = await _userRepository.deleteUser();

    either.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}

class CustomUserBloc extends StatelessWidget {
  final Widget Function(User) success;
  final bool isSetting;

  const CustomUserBloc({
    super.key,
    required this.success,
    this.isSetting = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            if (isSetting) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerCard(
                    margin: EdgeInsets.only(top: 6, left: 24, right: 24),
                    width: 180,
                    height: 18,
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
          failure: (_) {
            return Container();
          },
          success: (User user) {
            return success(user);
          },
        );
      },
    );
  }
}
