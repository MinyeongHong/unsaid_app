import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

String formatDate(
  DateTime dateTime, {
  String newPattern = 'yyyy.MM.dd(E) HH:mm',
}) {
  final DateFormat dateFormat = DateFormat(
    newPattern,
    Platform.localeName,
  );

  final String formatDateFormat = dateFormat.format(dateTime.toLocal());

  return formatDateFormat;
}

String formatNumber(
  num number, {
  int decimalDigits = 0,
}) {
  if (number.runtimeType == double) {
    final String numberToString = formatNumberToFixed(
      number.toDouble(),
      decimalDigits: decimalDigits,
    );

    number = double.parse(numberToString);
  }

  final NumberFormat numberFormat = NumberFormat.currency(
    locale: Platform.localeName,
    name: '',
    decimalDigits: decimalDigits,
  );

  final String formatNumberFormat = numberFormat.format(number);

  return formatNumberFormat;
}

String formatNumberToFixed(
  double value, {
  int decimalDigits = 2,
}) {
  final num powDecimalDigits = pow(10, decimalDigits);

  value = (value * powDecimalDigits).floor() / powDecimalDigits;

  if (value.isNaN || value.isInfinite) {
    return '0';
  } else if (value == 0) {
    return '0';
  } else {
    return value.toStringAsFixed(decimalDigits);
  }
}
