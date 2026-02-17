import 'package:flutter/material.dart';
import 'package:unsaid_app/app/home/home_page.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/animation.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/lottie_asset.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';

class SignSuccessPage extends StatefulWidget {
  const SignSuccessPage({super.key});

  @override
  State<SignSuccessPage> createState() => _SignSuccessPageState();
}

class _SignSuccessPageState extends State<SignSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomBody(
        top: true,
        children: [
          FadeInUpAnimationCard(
            child: BoldText(
              margin: EdgeInsets.only(top: 88, left: 60, right: 60),
              title: 'You’re in.',
              fontSize: 22,
              color: CustomColor.gray080,
              textAlign: TextAlign.center,
            ),
          ),
          CustomLottieAsset(
            margin: EdgeInsets.only(top: 48),
            width: screenWidth - 120,
            height: screenWidth - 120,
            name: 'assets/lotties/success.json',
          ),
        ],
        positioned: BottomButton(
          onTap: () {
            analyticsLogEvent('sign_success_click_start');

            resetRoute(
              page: HomePage(),
            );
          },
          title: 'Begin',
        ),
      ),
    );
  }
}
