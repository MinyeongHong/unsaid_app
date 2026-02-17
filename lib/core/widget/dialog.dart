import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/size.dart';

void customDialog({
  void Function()? whenComplete,
  EdgeInsetsGeometry margin = const EdgeInsets.only(left: 28, right: 28),
  bool barrierDismissible = true,
  required List<Widget> children,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return PopScope(
        canPop: barrierDismissible,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AlertDialog(
            insetPadding: EdgeInsets.only(left: 28, right: 28),
            titlePadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Container(
              margin: margin,
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(
    () {
      if (whenComplete != null) {
        whenComplete();
      }
    },
  );
}
