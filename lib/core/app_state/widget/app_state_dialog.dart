import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unsaid_app/core/app_state/model/app_state_model.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/function.dart';
import 'package:unsaid_app/core/util/url.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/dialog.dart';
import 'package:unsaid_app/core/widget/text.dart';

void appUpdateDialog({
  required AppState appState,
}) {
  customDialog(
    barrierDismissible: false,
    children: [
      BoldText(
        margin: EdgeInsets.only(top: 32),
        title: 'test 앱 업데이트 안내',
        fontSize: 22,
        color: CustomColor.gray080,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 16),
        title: '${appState.updateAppVersion}\n${appState.updateTitle}',
        fontSize: 16,
        color: CustomColor.gray080,
        height: 1.5,
        textAlign: TextAlign.center,
      ),
      CustomButton(
        onTap: () {
          customLaunchUrl(
            url: Platform.isIOS ? iosUrl : androidUrl,
          );
        },
        margin: EdgeInsets.only(top: 32, bottom: 28),
        title: '업데이트 하러가기',
      ),
    ],
  );
}

void appMaintenanceDialog({
  required AppState appState,
}) {
  customDialog(
    barrierDismissible: false,
    children: [
      BoldText(
        margin: EdgeInsets.only(top: 32),
        title: '앱 서버 점검 안내',
        fontSize: 22,
        color: CustomColor.gray080,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 16),
        title: appState.maintenanceTitle,
        fontSize: 18,
        color: CustomColor.gray080,
        textAlign: TextAlign.center,
      ),
      MediumText(
        margin: EdgeInsets.only(top: 16, bottom: 28),
        title: appState.getMaintenanceAtTitle(),
        fontSize: 16,
        color: CustomColor.gray080,
        textAlign: TextAlign.center,
      ),
    ],
  );
}
