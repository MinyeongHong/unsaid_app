import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/input_formatter.dart';
import 'package:unsaid_app/core/widget/text.dart';

class NumberTextField extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsets scrollPadding;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final int decimalPoint;
  final double radius;
  final String type;
  final String? hintText;
  final bool readOnly;
  final bool isError;
  final Color fillColor;
  final TextStyle style;
  final Widget suffixIcon;

  const NumberTextField({
    super.key,
    required this.margin,
    this.scrollPadding = const EdgeInsets.all(20),
    required this.controller,
    this.focusNode,
    this.decimalPoint = 0,
    required this.radius,
    this.type = 'point',
    this.hintText,
    this.readOnly = false,
    this.isError = false,
    this.fillColor = CustomColor.gray080,
    required this.style,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        onTap: () {
          final int length = controller.text.length;

          if (type == 'credit') {
            final int offset = length - 2;

            controller.selection = TextSelection.collapsed(offset: offset.clamp(0, length));
          } else {
            controller.selection = TextSelection.collapsed(offset: length);
          }
        },
        scrollPadding: scrollPadding,
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        enableInteractiveSelection: !readOnly,
        textAlign: TextAlign.end,
        keyboardType: TextInputType.numberWithOptions(decimal: decimalPoint > 0),
        inputFormatters: [
          NumberInputFormatter(decimalPoint: decimalPoint, isCredit: type == 'credit'),
        ],
        style: style,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 12, left: 16, bottom: 12),
          counterText: '',
          hintText: hintText,
          isDense: true,
          filled: true,
          fillColor: fillColor,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: CustomColor.gray080,
          ),
          suffixIcon: Container(margin: EdgeInsets.only(right: 16), child: suffixIcon),
          suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: isError ? CustomColor.gray080 : CustomColor.gray080),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: readOnly
                  ? CustomColor.gray080
                  : isError
                  ? CustomColor.gray080
                  : CustomColor.gray080,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

class OutLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final double? cursorWidth;

  const OutLineTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.textAlign,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.cursorWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: TextField(
        onTap: () {
          controller.selection = TextSelection.collapsed(offset: controller.text.length);
        },
        scrollPadding: EdgeInsets.only(bottom: 250),
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        cursorWidth: cursorWidth ?? 2,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: CustomColor.gray060),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: hintText,
          counterText: '',
          errorStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: CustomColor.gray050,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.gray020),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.gray080),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class UnderLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String? infoTitle;
  final bool enabled;

  const UnderLineTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.infoTitle,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 28, right: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            onTap: () {
              controller.selection = TextSelection.collapsed(offset: controller.text.length);
            },
            controller: controller,
            focusNode: focusNode,
            enabled: enabled,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            inputFormatters: [NumberInputFormatter()],
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22, color: CustomColor.gray080),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 6),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: CustomColor.gray080,
              ),
              suffixIcon: MediumText(title: ' C', fontSize: 22, color: CustomColor.gray080),
              suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: infoTitle != null ? CustomColor.gray080 : CustomColor.gray080,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: infoTitle != null ? CustomColor.gray080 : CustomColor.gray080,
                  width: 2,
                ),
              ),
            ),
          ),
          if (infoTitle != null)
            NormalText(
              margin: EdgeInsets.only(top: 8),
              title: infoTitle!,
              fontSize: 14,
              color: CustomColor.gray080,
            )
          else
            Container(),
        ],
      ),
    );
  }
}

class NoLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  const NoLineTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 28, right: 28),
      child: TextField(
        scrollPadding: EdgeInsets.only(bottom: 250),
        controller: controller,
        focusNode: focusNode,
        maxLines: 10,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: CustomColor.gray080),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: '',
          isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: CustomColor.gray080,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
