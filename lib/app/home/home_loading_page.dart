import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/lottie_asset.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';

class HomeLoadingPage extends StatelessWidget {
  const HomeLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FixedBody(
        children: [
          Container(
            margin: EdgeInsets.only(top: 140),
            child: Stack(
              alignment: AlignmentGeometry.center,
              clipBehavior: Clip.none,
              children: [
                CustomLottieAsset(
                  width: screenWidth / 6,
                  height: screenWidth / 6,
                  name: 'assets/lotties/circle.json',
                  duration: Duration(seconds: 3),
                ),
                Positioned(
                  child: Center(
                    child: Column(
                      children: [
                        BoldText(
                          title: 'Thinking...',
                          fontSize: 18,
                          color: CustomColor.gray080,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          NormalText(
            margin: EdgeInsets.only(top: 48),
            title: 'This isn’t about the future',
            fontSize: 14,
            color: CustomColor.gray040,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
