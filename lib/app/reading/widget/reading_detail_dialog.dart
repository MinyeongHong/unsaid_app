import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/dialog.dart';
import 'package:unsaid_app/core/widget/text.dart';

void readingDetailDeleteDialog({
  required void Function() onTap,
}) {
  dialogLog('readingDetailDeleteDialog');

  customDialog(
    children: [
      BoldText(
        margin: EdgeInsets.only(top: 32),
        title: 'Delete this reading?',
        fontSize: 20,
        color: CustomColor.gray070,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 8),
        title: 'It will be removed permanently.',
        fontSize: 16,
        color: CustomColor.gray060,
        textAlign: TextAlign.center,
      ),
      Container(
        margin: EdgeInsets.only(top: 32, bottom: 32),
        child: Wrap(
          spacing: 12,
          children: [
            FadeButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.zero,
              child: Container(
                width: (screenWidth - 124) / 2,
                height: 56,
                child: Center(
                  child: MediumText(
                    title: 'Cancel',
                    fontSize: 18,
                    color: CustomColor.gray070,
                  ),
                ),
              ),
            ),

            CustomButton(
              onTap: () {
                Navigator.of(context).pop();

                onTap();
              },
              title: 'Delete',
              fontWeight: FontWeight.w500,
              width: (screenWidth - 124) / 2,
              color: Color(0xFF6B2A2A),
            ),
          ],
        ),
      ),
    ],
  );
}
