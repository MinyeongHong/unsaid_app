import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/sign/widget/sign_birth_widget.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  bool _isLoading = false;

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
    if (month < 1 || month > 12 || day < 1 || day > 31 || year < 1950 || year > 2015) return null;

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

      BlocProvider.of<UserBloc>(context).add(UserEvent.update(user));

      Navigator.pop(context);

      successToast('Successfully changed');
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
      title: 'Edit Birth',
      body: CustomBody(
        children: [
          BoldText(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            title: 'When is your birthday?',
            fontSize: 22,
            color: CustomColor.gray080,
            textAlign: TextAlign.center,
          ),
          NormalText(
            margin: EdgeInsets.only(top: 16, left: 24, right: 24),
            title: 'Sometimes it can help you find the answer',
            fontSize: 16,
            color: CustomColor.gray060,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: SignBirthDateField(
              onRawChanged: (raw) {
                setState(() {
                  _birth = _parseBirthDate(raw);
                  _errorText = (raw.length == 8 && _birth == null)
                      ? 'Please enter your correct date of birth.'
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
        positioned: BottomButton(
          onTap: () {
            _updateUser();
          },
          title: 'Done',
          isActive: _isActive,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
