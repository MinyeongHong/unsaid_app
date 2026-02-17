import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/widget/bottom_sheet.dart';
import 'package:unsaid_app/core/widget/text.dart';

void userDeleteSheet({
  required void Function() onTap,
}) {
  sheetLog('userDeleteSheet');
  analyticsLogEvent('user_show_delete_sheet');

  customBottomSheet(
    children: [
      BottomSheetCard(),
      BoldText(
        margin: EdgeInsets.only(top: 20),
        title: 'Delete your account?',
        fontSize: 24,
        color: CustomColor.gray080,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 12),
        title: 'Your data will be permanently removed. This action cannot be undone.',
        fontSize: 18,
        color: CustomColor.gray060,
      ),
      BottomSheetButton(
        onTap: () {
          analyticsLogEvent('user_delete_sheet_click_delete');

          Navigator.of(context).pop();

          onTap();
        },
        title: 'Delete',
      ),
    ],
  );
}

void userSignOutSheet({
  required void Function() onTap,
}) {
  sheetLog('userSignOutSheet');
  analyticsLogEvent('user__show_sign_out_sheet');

  customBottomSheet(
    children: [
      BottomSheetCard(),
      BoldText(
        margin: EdgeInsets.only(top: 20),
        title: 'Leave for now?',
        fontSize: 24,
        color: CustomColor.gray080,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 12),
        title: 'You can log back in anytime.',
        fontSize: 18,
        color: CustomColor.gray060,
      ),
      BottomSheetButton(
        onTap: () {
          analyticsLogEvent('user_sign_out_sheet_click_sign_out');

          Navigator.of(context).pop();

          onTap();
        },
        title: 'Log out',
      ),
    ],
  );
}
