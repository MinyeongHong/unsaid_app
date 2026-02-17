import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:unsaid_app/app/user_setting/widget/user_setting_widget.dart';
import 'package:unsaid_app/core/auth/bloc/auth_bloc.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/user/page/user_edit_page.dart';
import 'package:unsaid_app/core/user/widget/user_sheet.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/line.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _isLoading = false;

  void _deleteUser() async {
    if (_isLoading) return;

    try {
      setState(() {
        _isLoading = true;
      });

      await UserBloc.deleteUser();

      BlocProvider.of<AuthBloc>(context).add(
        AuthEvent.signOut(),
      );

      successToast('Successfully deleted my account.');
    } catch (e) {
      errorToast(e);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Personal',
      isLoading: _isLoading,
      body: CustomBody(
        children: [
          BoldText(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            title: 'Account',
            fontSize: 16,
            color: CustomColor.gray070,
          ),
          CustomUserBloc(
            isSetting: true,
            success: (User user) {
              return MediumText(
                margin: EdgeInsets.only(top: 4, left: 24, right: 24),
                title: user.email,
                fontSize: 14,
                color: CustomColor.gray050,
              );
            },
          ),
          BoldText(
            margin: EdgeInsets.only(top: 12, left: 24, right: 24),
            title: 'Birth',
            fontSize: 16,
            color: CustomColor.gray070,
          ),
          CustomUserBloc(
            isSetting: true,
            success: (User user) {
              return MediumText(
                margin: EdgeInsets.only(top: 4, left: 24, right: 24),
                title: user.birth != null ? DateFormat('MMM d, y').format(user.birth!) : 'No data',
                fontSize: 14,
                color: CustomColor.gray050,
              );
            },
          ),
          ThinLineCard(
            margin: EdgeInsets.only(top: 16),
          ),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_notification');

              addRoute(
                page: UserEditPage(),
              );
            },
            title: 'Edit Birth',
          ),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_service');

              userSignOutSheet(
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthEvent.signOut(),
                  );
                },
              );
            },
            title: 'Log out',
          ),
          Center(
            child: FadeButton(
              onTap: () {
                analyticsLogEvent('');

                userDeleteSheet(
                  onTap: () {
                    _deleteUser();
                  },
                );
              },
              margin: EdgeInsets.only(top: 24),
              child: NormalText(
                title: 'Delete Account',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: CustomColor.gray040,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
