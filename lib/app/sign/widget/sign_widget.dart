import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/inkwell.dart';
import 'package:unsaid_app/core/widget/loading.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';

class SignButton extends StatelessWidget {
  final void Function() onTap;
  final String type;
  final String title;
  final String icon;
  final bool isLoading;
  final Color color;

  const SignButton({
    super.key,
    required this.onTap,
    required this.type,
    required this.title,
    required this.icon,
    this.isLoading = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 28, right: 28),
      height: 56,
      decoration: BoxDecoration(
        color: color,
        border: type == 'google' ? Border.all(color: CustomColor.gray030) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomInkWell(
        onTap: onTap,
        borderRadius: type == 'google' ? BorderRadius.circular(9) : BorderRadius.circular(10),
        child: isLoading
            ? ButtonLoading(color: CustomColor.gray020)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvgAsset(
                    name: icon,
                    width: 24,
                    height: 24,
                  ),
                  MediumText(
                    margin: EdgeInsets.only(left: 6),
                    title: title,
                    fontSize: 16,
                    color: CustomColor.gray010,
                  ),
                ],
              ),
      ),
    );
  }
}
