import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTap;
  final String title;
  final bool canPop;
  final bool isLeading;
  final bool isFullscreen;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    this.onTap,
    required this.title,
    this.canPop = true,
    this.isLeading = true,
    this.isFullscreen = false,
    this.actions,
  }) : super(key: key);

  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 54,
      automaticallyImplyLeading: false,
      shape: isFullscreen
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            )
          : null,
      leading: isLeading && !isFullscreen
          ? FadeButton(
              onTap: () {
                if (!canPop) return;

                FocusScope.of(context).unfocus();

                if (onTap != null) {
                  onTap!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              margin: EdgeInsets.only(left: 14),
              child: CustomSvgAsset(
                name: 'icons/chevron_left',
              ),
            )
          : Container(),
      title: BoldText(
        title: title,
        fontSize: 16,
        color: CustomColor.gray070,
      ),
      actions: isFullscreen
          ? [
              FadeButton(
                onTap: () {
                  if (!canPop) return;

                  FocusScope.of(context).unfocus();

                  if (onTap != null) {
                    onTap!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                margin: EdgeInsets.only(right: 14),
                child: CustomSvgAsset(
                  name: 'icons/chevron_left',
                ),
              ),
            ]
          : actions,
    );
  }
}
