import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/home/home_page.dart';
import 'package:unsaid_app/app/sign/page/sign_agree_page.dart';
import 'package:unsaid_app/app/sign/widget/sign_widget.dart';
import 'package:unsaid_app/app/zodiac/page/zodiac_page.dart';
import 'package:unsaid_app/core/app_state/bloc/app_state_bloc.dart';
import 'package:unsaid_app/core/auth/bloc/auth_bloc.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/firebase.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final Map<String, dynamic> _providerInfos = {
    'google': {'title': 'Sign in with Google', 'icon': 'icons/google', 'is_loading': false},
    'apple': {'title': 'Sign in with Apple', 'icon': 'icons/apple_white', 'is_loading': false},
  };

  UserAdd _userAdd = UserAdd();

  bool get _isSignGuide => box.get('is_sign_guide') ?? true;
  bool get _isAnyLoading => _providerInfos.values.any((provider) => provider['is_loading']);

  @override
  void initState() {
    if (_isSignGuide) {
      analyticsLogEvent('sign_guide_open');
    } else {
      analyticsLogEvent('sign_open');
    }

    super.initState();
  }

  void _sign(String provider) async {
    if (_isAnyLoading) return;

    try {
      analyticsLogEvent('sign_click_$provider');

      setState(() {
        _providerInfos[provider]['is_loading'] = true;
      });

      if (provider == 'apple') {
        await _signApple();
      } else if (provider == 'google') {
        await _signGoogle();
      }

      await firebaseAuth.currentUser?.getIdToken();

      final User user = await UserBloc.addUser(_userAdd);

      analyticsLogEvent('sign_done');

      BlocProvider.of<AuthBloc>(context).add(AuthEvent.signIn());

      if (!user.isAgreed) {
        addRoute(
          context: context,
          page: SignAgreePage(
            hasAppBar: false,
          ),
        );
      } else if (!user.isBirthCompleted) {
        addRoute(
          context: context,
          page: ZodiacPage(),
        );
      } else {
        resetRoute(
          page: HomePage(),
        );
      }
    } on FirebaseException catch (e) {
      errorToast(context, e);
    } catch (e) {
      if (e is Failure) {
        final msg = e.error.toString().toLowerCase();

        if (msg.contains('cancel')) return;
      }

      errorToast(context, e);
    } finally {
      if (mounted) {
        setState(() {
          _providerInfos[provider]['is_loading'] = false;
        });
      }
    }
  }

  Future<void> _signApple() async {
    try {
      final UserCredential userCredential = await AuthBloc.signApple();

      if (mounted) {
        setState(() {
          _userAdd.uid = userCredential.user!.uid;
          _userAdd.provider = 'apple';
          _userAdd.email = userCredential.user!.providerData[0].email;
        });
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> _signGoogle() async {
    try {
      final UserCredential userCredential = await AuthBloc.signGoogle();

      if (mounted) {
        setState(() {
          _userAdd.uid = userCredential.user!.uid;
          _userAdd.provider = 'google';
          _userAdd.email = userCredential.user!.providerData[0].email;
        });
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: false,
      body: CustomAppStateBloc(
        child: CustomBody(
          top: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: MediumText(
                margin: EdgeInsets.only(top: 160, left: 24, right: 24),
                title: 'UNSAID',
                fontSize: 40,
                color: CustomColor.primary,
                spacing: 16.0,
              ),
            ),
            Center(
              child: MediumText(
                margin: EdgeInsets.only(top: 18, left: 24, right: 24),
                title: 'What no one says',
                fontSize: 18,
                color: CustomColor.gray040,
                spacing: 3.0,
              ),
            ),
          ],
          sliverFillRemaining: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: _providerInfos
                    .map((provider, info) {
                      return MapEntry(
                        provider,
                        provider == 'apple' && Platform.isAndroid
                            ? Container()
                            : SignButton(
                                onTap: () {
                                  _sign(provider);
                                },
                                type: provider,
                                color: CustomColor.gray080,
                                title: info['title'],
                                icon: info['icon'],
                                isLoading: info['is_loading'],
                              ),
                      );
                    })
                    .values
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
