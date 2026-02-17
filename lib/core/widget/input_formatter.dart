import 'dart:math';
import 'package:flutter/services.dart';
import 'package:unsaid_app/core/util/format.dart';

class NumberInputFormatter extends CustomTextInputFormatter {
  final int decimalPoint;
  final bool isCredit;

  RegExp _regExp;

  NumberInputFormatter({
    this.decimalPoint = 0,
    this.isCredit = false,
  })  : _regExp = decimalPoint > 0 ? RegExp('[0-9]+([.])?') : RegExp('[0-9]'),
        super(isCredit);

  @override
  String _formatPattern(String digits) {
    if (digits.isEmpty) return '';

    if (isCredit) {
      digits = digits + '0' * (3 - digits.length);
    }

    final int firstDigitsToInt = int.parse(digits.split('.').first);

    String firstText = formatNumber(firstDigitsToInt);

    if (digits.split('.').first.length > 10) {
      firstText = digits.substring(0, 10);

      final int firstTextToInt = int.parse(firstText.split('.').first);

      firstText = formatNumber(firstTextToInt);
    }

    late String result;

    if (digits.contains('.')) {
      String lastText = digits.split('.').last;

      if (lastText.length > decimalPoint) {
        lastText = lastText.substring(0, decimalPoint);
      }

      result = firstText + '.' + lastText;
    } else {
      result = firstText;
    }

    return result;
  }

  @override
  TextEditingValue _formatValue(TextEditingValue oldValue, TextEditingValue newValue) {
    return FilteringTextInputFormatter.allow(
      _regExp,
    ).formatEditUpdate(oldValue, newValue);
  }

  @override
  bool _isUserInput(String s) {
    return s == '.' || _regExp.firstMatch(s) != null;
  }
}

abstract class CustomTextInputFormatter extends TextInputFormatter {
  final bool isCredit;

  CustomTextInputFormatter(this.isCredit);

  TextEditingValue? _lastNewValue;

  String _formatPattern(String digits);

  TextEditingValue _formatValue(TextEditingValue oldValue, TextEditingValue newValue);

  bool _isUserInput(String s);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (isCredit) {
      final String replaceNewValue = newValue.text.replaceAll(',', '');
      final int newValueToInt = int.tryParse(replaceNewValue) ?? 0;

      if (newValueToInt >= 100) {
        if (replaceNewValue.length > 10 || newValueToInt % 100 != 0) {
          return oldValue;
        }
      }
    }

    if (newValue.text == _lastNewValue?.text) {
      return oldValue;
    }

    _lastNewValue = newValue;

    newValue = _formatValue(oldValue, newValue);

    final String newText = _formatPattern(newValue.text);

    int selectionIndex = newValue.selection.end;
    int insertCount = 0;
    int inputCount = 0;

    for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
      final character = newText[i];
      if (_isUserInput(character)) {
        inputCount++;
      } else {
        insertCount++;
      }
    }

    selectionIndex += insertCount;
    selectionIndex = min(selectionIndex, newText.length);

    if (selectionIndex - 1 >= 0 &&
        selectionIndex - 1 < newText.length &&
        !_isUserInput(newText[selectionIndex - 1])) {
      selectionIndex--;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
