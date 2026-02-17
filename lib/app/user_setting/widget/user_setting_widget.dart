import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/inkwell.dart';
import 'package:unsaid_app/core/widget/line.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:flutter/cupertino.dart';

class UserSettingCard extends StatelessWidget {
  final void Function() onTap;
  final String title;

  const UserSettingCard({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInkWell(
          onTap: onTap,
          padding: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MediumText(
                  title: title,
                  fontSize: 16,
                  color: CustomColor.gray070,
                ),
              ),
              CustomSvgAsset(
                name: 'icons/chevron_right',
                width: 16,
                height: 16,
                color: CustomColor.gray040,
              ),
            ],
          ),
        ),
        ThinLineCard(),
      ],
    );
  }
}

class UserSettingSwitchButton extends StatelessWidget {
  final void Function(bool) onChanged;
  final String title;
  final String? contents;
  final bool value;

  const UserSettingSwitchButton({
    super.key,
    required this.onChanged,
    required this.title,
    this.contents,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediumText(
                      title: title,
                      fontSize: 16,
                      color: CustomColor.gray070,
                    ),
                    if (contents != null)
                      NormalText(
                        margin: EdgeInsets.only(top: 4),
                        title: contents!,
                        fontSize: 12,
                        color: CustomColor.gray040,
                      )
                    else
                      Container(),
                  ],
                ),
              ),
              CupertinoSwitch(
                onChanged: onChanged,
                value: value,
              ),
            ],
          ),
        ),
        ThinLineCard(),
      ],
    );
  }
}
