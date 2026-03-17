import 'package:flutter/material.dart';
import 'package:unsaid_app/app/sign/widget/sign_agree_widget.dart';
import 'package:unsaid_app/app/user_agreement/user_agreement_repository.dart';
import 'package:unsaid_app/app/zodiac/page/zodiac_page.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/util/url.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/line.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';
import 'package:unsaid_app/core/widget/web_view.dart';

class SignAgreePage extends StatefulWidget {
  final bool hasAppBar;

  const SignAgreePage({
    super.key,
    this.hasAppBar = true,
  });

  @override
  State<SignAgreePage> createState() => _SignAgreePageState();
}

class _SignAgreePageState extends State<SignAgreePage> {
  late bool _hasAppBar = widget.hasAppBar;

  bool _isLoading = false;

  List<bool> _agreements = List.generate(4, (_) => false);

  bool get _isAllCheck => _agreements.every((agreement) => agreement);
  bool get _isNext => _agreements[0] && _agreements[1] && _agreements[2];

  void _addUserAgreement() async {
    if (_isLoading) return;
    if (!_isNext) return;

    try {
      analyticsLogEvent('sign_agree_click_next');

      setState(() {
        _isLoading = true;
      });

      await UserAgreementRepository.addUserAgreement(
        isMarketing: _agreements[3],
      );

      addRoute(
        context: context,
        page: ZodiacPage(),
      );
    } catch (e) {
      errorToast(context, e);
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
      canPop: !_isLoading,
      title: '',
      isLeading: _hasAppBar,
      body: CustomBody(
        bottom: screenBottom + 84,
        top: !_hasAppBar,
        children: [
          BoldText(
            margin: EdgeInsets.only(top: 24 + (_hasAppBar ? 0 : statusBarHeight), left: 24),
            title: ' Before you begin',
            fontSize: 22,
            color: CustomColor.gray090,
          ),
        ],
        sliverFillRemaining: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SignAgreeCard(
              onTap: () {
                analyticsLogEvent(
                  'sign_agree_click_all',
                  parameters: {
                    'type': _isAllCheck ? 'off' : 'on',
                  },
                );

                setState(() {
                  if (_isAllCheck) {
                    _agreements = _agreements.map((_) => false).toList();
                  } else {
                    _agreements = _agreements.map((_) => true).toList();
                  }
                });
              },
              margin: EdgeInsets.only(top: 8),
              title: 'Select all',
              isActive: _isAllCheck,
            ),
            ThinLineCard(),
            SignAgreeCard(
              onTap: () {
                analyticsLogEvent(
                  'sign_agree_click_age',
                  parameters: {
                    'type': _agreements[0] ? 'off' : 'on',
                  },
                );

                setState(() {
                  _agreements[0] = !_agreements[0];
                });
              },
              margin: EdgeInsets.only(top: 8),
              type: 'essential',
              title: 'I confirm I am 14 or older',
              isActive: _agreements[0],
            ),
            SignAgreeCard(
              onTap: () {
                analyticsLogEvent(
                  'sign_agree_click_privacy',
                  parameters: {
                    'type': _agreements[1] ? 'off' : 'on',
                  },
                );

                setState(() {
                  _agreements[1] = !_agreements[1];
                });
              },
              onTapView: () {
                analyticsLogEvent('sign_agree_click_view_privacy');

                addRoute(
                  context: context,
                  page: WebViewPage(
                    title: 'Privacy Policy',
                    url: privacyTermsUrl,
                  ),
                );
              },
              type: 'essential',
              title: 'I’ve read the Privacy Policy',
              isActive: _agreements[1],
            ),
            SignAgreeCard(
              onTap: () {
                analyticsLogEvent(
                  'sign_agree_click_service',
                  parameters: {
                    'type': _agreements[2] ? 'off' : 'on',
                  },
                );

                setState(() {
                  _agreements[2] = !_agreements[2];
                });
              },
              onTapView: () {
                analyticsLogEvent('sign_agree_click_view_service');

                addRoute(
                  context: context,
                  page: WebViewPage(
                    title: 'Terms Of Service',
                    url: serviceTermsUrl,
                  ),
                );
              },
              type: 'essential',
              title: 'I accept the Terms of Service',
              isActive: _agreements[2],
            ),
            ThinLineCard(),
            SignAgreeCard(
              onTap: () {
                analyticsLogEvent(
                  'sign_agree_click_marketing',
                  parameters: {
                    'type': _agreements[3] ? 'off' : 'on',
                  },
                );

                setState(() {
                  _agreements[3] = !_agreements[3];
                });
              },
              type: 'optional',
              title: 'Send me occasional updates',
              isActive: _agreements[3],
            ),
          ],
        ),
        positioned: BottomButton(
          onTap: () {
            _addUserAgreement();
          },
          title: 'Continue',
          isActive: _isNext,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
