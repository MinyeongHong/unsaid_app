import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/inkwell.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';

class SignAgreeCard extends StatelessWidget {
  final Function() onTap;
  final Function()? onTapView;
  final EdgeInsetsGeometry? margin;
  final String? type;
  final String title;
  final bool isActive;

  const SignAgreeCard({
    super.key,
    required this.onTap,
    this.onTapView,
    this.margin,
    this.type,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomInkWell(
            onTap: onTap,
            padding: EdgeInsets.only(top: 10, left: 24, right: 14, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSvgAsset(
                  name: 'icons/check_mono',
                  width: 24,
                  height: 24,
                  color: isActive ? CustomColor.gray090 : CustomColor.gray030,
                ),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomRichText(
                          margin: EdgeInsets.only(left: 8),
                          texts: [
                            title,
                            type == 'essential'
                                ? ' (Required)'
                                : type == 'optional'
                                ? ' (Optional)'
                                : '',
                          ],
                          fontSizes: [
                            14,
                          ],
                          colors: [
                            CustomColor.gray060,
                            type == 'essential'
                                ? CustomColor.gray040
                                : type == 'optional'
                                ? CustomColor.gray030
                                : CustomColor.gray030,
                          ],
                          fontWeights: [
                            FontWeight.w500,
                          ],
                        ),
                      ),
                      if (onTapView != null)
                        Container(
                          width: 42,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (onTapView != null)
            Positioned(
              right: 14,
              child: FadeButton(
                onTap: onTapView,
                child: NormalText(
                  title: 'View',
                  fontSize: 12,
                  color: CustomColor.gray080,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
