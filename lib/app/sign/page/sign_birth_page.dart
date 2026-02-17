import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/sign/page/sign_success_page.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/app/sign/widget/sign_birth_widget.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class SignBirthPage extends StatefulWidget {
  final bool hasAppBar;

  const SignBirthPage({
    super.key,
    this.hasAppBar = true,
  });

  @override
  State<SignBirthPage> createState() => _SignBirthPageState();
}

class _SignBirthPageState extends State<SignBirthPage> {
  late bool _hasAppBar = widget.hasAppBar;

  bool _isLoading = false;
  bool _isSkipLoading = false;

  String? _errorText;

  DateTime? _birth;

  bool get _isActive => _birth != null;

  /// 8자리(ddmmYYYY)만 검증. 파싱 함수는 _errorText를 건드리지 않음.
  DateTime? _parseBirthDate(String raw) {
    if (raw.length != 8) return null;

    final int? day = int.tryParse(raw.substring(0, 2));
    final int? month = int.tryParse(raw.substring(2, 4));
    final int? year = int.tryParse(raw.substring(4, 8));

    if (day == null || month == null || year == null) return null;
    if (month < 1 || month > 12 || day < 1 || day > 31) return null;

    try {
      final DateTime birth = DateTime(year, month, day);

      if (birth.month != month || birth.day != day) return null;

      return birth;
    } catch (_) {
      return null;
    }
  }

  void _updateUser() async {
    if (_isLoading) return;
    if (_birth == null) return;

    try {
      analyticsLogEvent('sign_birth_click_complete');

      FocusScope.of(context).unfocus();

      setState(() {
        _isLoading = true;
      });

      final User user = await UserBloc.updateUser(_birth!);

      BlocProvider.of<UserBloc>(context).add(
        UserEvent.update(user),
      );

      addRoute(
        page: SignSuccessPage(),
      );
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

  void _updateUserWithSkip() async {
    if (_isLoading) return;
    if (_isSkipLoading) return;

    try {
      analyticsLogEvent('sign_birth_click_skip');

      FocusScope.of(context).unfocus();

      setState(() {
        _isSkipLoading = true;
      });

      final User user = await UserBloc.updateUser(null);

      BlocProvider.of<UserBloc>(context).add(
        UserEvent.update(user),
      );

      addRoute(
        page: SignSuccessPage(),
      );
    } catch (e) {
      errorToast(e);
    } finally {
      if (mounted) {
        setState(() {
          _isSkipLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _hasAppBar ? '' : null,
      isLoading: _isSkipLoading,
      body: CustomBody(
        bottom: screenBottom + 84,
        top: !_hasAppBar,
        positioned: Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onTap: () {
                  _updateUser();
                },
                margin: EdgeInsets.only(left: 28, right: 28),
                title: 'Save and continue',
                isActive: _isActive,
                isLoading: _isLoading,
              ),
              FadeButton(
                onTap: () {
                  _updateUserWithSkip();
                },
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? screenBottom : 20,
                ),
                child: UnderlineText(
                  title: 'Skip for now',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: CustomColor.gray060,
                ),
              ),
            ],
          ),
        ),
        children: [
          BoldText(
            margin: EdgeInsets.only(
              top: 32 + (_hasAppBar ? 0 : statusBarHeight),
              left: 24,
              right: 24,
            ),
            title: 'Your birth date\ncan refine interpretation.',
            fontSize: 26,
            color: CustomColor.gray080,
            textAlign: TextAlign.center,
          ),
          MediumText(
            margin: EdgeInsets.only(top: 12, left: 24, right: 24),
            title: 'When were you born?',
            fontSize: 20,
            color: CustomColor.gray070,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: SignBirthDateField(
              onRawChanged: (raw) {
                setState(() {
                  _birth = _parseBirthDate(raw);
                  _errorText = (raw.length == 8 && _birth == null)
                      ? 'That date doesn’t look right.'
                      : null;
                });
              },
            ),
          ),
          if (_errorText != null)
            MediumText(
              margin: EdgeInsets.only(top: 8, left: 24),
              title: _errorText!,
              fontSize: 16,
              color: CustomColor.gray070,
            )
          else
            Container(),
        ],
      ),
    );
  }
}
