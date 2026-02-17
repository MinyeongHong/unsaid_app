import 'package:unsaid_app/app/user_setting/bloc/user_setting_bloc.dart';
import 'package:unsaid_app/app/user_setting/model/user_setting_model.dart';
import 'package:unsaid_app/app/user_setting/widget/user_setting_widget.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/date.dart';
import 'package:unsaid_app/core/util/format.dart';
import 'package:unsaid_app/core/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettingNotificationPage extends StatefulWidget {
  const UserSettingNotificationPage({super.key});

  @override
  State<UserSettingNotificationPage> createState() => _UserSettingNotificationPageState();
}

class _UserSettingNotificationPageState extends State<UserSettingNotificationPage> {
  late UserSetting _userSetting;

  bool _isSuccess = false;

  void _updateUserSetting() async {
    try {
      analyticsLogEvent(
        'user_setting_notification_click_marketing',
        parameters: {
          'type': _userSetting.isMarketing ? 'on' : 'off',
        },
      );

      BlocProvider.of<UserSettingBloc>(context).add(
        UserSettingEvent.update(_userSetting),
      );

      await UserSettingBloc.updateUserSetting(_userSetting);

      final String formatNowDate = formatDate(
        nowDate,
        newPattern: 'dd/MM/yyyy',
      );

      successToast(
        _userSetting.isMarketing
            ? 'Marketing notifications enabled on $formatNowDate.'
            : 'Marketing notifications disabled on $formatNowDate.',
      );
    } catch (e) {
      if (mounted) {
        BlocProvider.of<UserSettingBloc>(context).add(
          UserSettingEvent.fetch(),
        );
      }

      errorToast(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Notification Settings',
      body: CustomBody(
        children: [
          CustomUserSettingBloc(
            success: (UserSetting userSetting) {
              if (!_isSuccess) {
                _isSuccess = true;
                _userSetting = userSetting;
              }

              return UserSettingSwitchButton(
                onChanged: (bool value) {
                  setState(() {
                    _userSetting = _userSetting.copyWith(
                      isMarketing: value,
                    );
                  });

                  _updateUserSetting();
                },
                title: 'Marketing Notifications',
                contents:
                    'Get updates on events and special offers through promotional notifications.',
                value: _userSetting.isMarketing,
              );
            },
          ),
        ],
      ),
    );
  }
}
