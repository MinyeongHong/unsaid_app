import 'dart:convert';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';

void customToast(String title) {
  showFlash(
    context: context,
    duration: Duration(milliseconds: 2500),
    builder: (context, controller) {
      return GestureDetector(
        onTap: () {
          controller.dismiss();
        },
        child: FlashBar(
          controller: controller,
          margin: EdgeInsets.only(
            left: 28,
            right: 28,
            bottom: screenBottom,
          ),
          backgroundColor: CustomColor.gray070,
          useSafeArea: false,
          behavior: FlashBehavior.floating,
          content: NormalText(
            title: title,
            fontSize: 14,
            color: CustomColor.gray000,
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}

void successToast(String title) {
  showFlash(
    context: context,
    duration: Duration(milliseconds: 2500),
    builder: (context, controller) {
      return GestureDetector(
        onTap: () {
          controller.dismiss();
        },
        child: FlashBar(
          controller: controller,
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: screenBottom,
          ),
          elevation: 0,
          useSafeArea: false,
          behavior: FlashBehavior.floating,
          content: Container(),
          builder: (context, _) {
            return Container(
              margin: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSvgAsset(
                    name: 'icons/alert_circle',
                    width: 18,
                    height: 18,
                    color: CustomColor.gray020,
                  ),
                  Flexible(
                    child: NormalText(
                      margin: EdgeInsets.only(left: 8),
                      title: title,
                      fontSize: 14,
                      color: CustomColor.gray000,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

void errorToast(BuildContext context, Object error) {
  String errorMessage = '서버 오류가 발생했어요.\n잠시 후 다시 시도해 주세요.';

  try {
    final dynamic errorToJson = jsonDecode(jsonEncode((error as Failure).error));

    if (errorToJson['status'] != null) {
      final int status = errorToJson['status'];

      if (status >= 400 && status < 500) {
        errorMessage = errorToJson['message'];
      }
    }
  } catch (_) {}

  final bool isErrorLog = error.runtimeType != Failure;

  if (isErrorLog) {
    errorLog(error.toString(), error);
  }

  showFlash(
    context: context,
    duration: Duration(milliseconds: 2500),
    builder: (context, controller) {
      return GestureDetector(
        onTap: () {
          controller.dismiss();
        },
        child: FlashBar(
          controller: controller,
          margin: EdgeInsets.only(
            left: 28,
            right: 28,
            bottom: screenBottom,
          ),
          useSafeArea: false,
          behavior: FlashBehavior.floating,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgAsset(
                name: 'icons/x_mono',
              ),
              Flexible(
                child: NormalText(
                  margin: EdgeInsets.only(left: 8),
                  title: errorMessage,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
