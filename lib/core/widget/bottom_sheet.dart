import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/button.dart';

void customBottomSheet({
  void Function()? whenComplete,
  EdgeInsetsGeometry margin = const EdgeInsets.only(left: 24, right: 24),
  double? height,
  bool isDismissible = true,
  required List<Widget> children,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return PopScope(
        canPop: isDismissible,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: screenBottom),
                  child: Container(
                    margin: margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: children,
                    ),
                  ),
                ),
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

void pageBottomSheet(
  BuildContext context, {
  bool hasShape = true,
  required Widget page,
}) {
  sheetLog('pageBottomSheet');

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    barrierColor: Colors.black.withOpacity(0.4),
    shape: hasShape
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          )
        : RoundedRectangleBorder(),
    builder: (context) {
      return page;
    },
  );
}

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        width: 80,
        height: 6,
        decoration: BoxDecoration(
          color: CustomColor.gray080,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  final void Function() onTap;
  final String title;

  const BottomSheetButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Wrap(
        spacing: 24,
        children: [
          CustomButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            title: 'Cancel',
            width: (screenWidth - 72) / 2,
            color: CustomColor.gray020,
            titleColor: CustomColor.gray060,
            fontWeight: FontWeight.w500,
          ),
          CustomButton(
            onTap: onTap,
            title: title,
            width: (screenWidth - 72) / 2,
            color: CustomColor.primary,
          ),
        ],
      ),
    );
  }
}
