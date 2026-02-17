import 'package:flutter/material.dart';
import 'package:unsaid_app/core/util/common.dart';

final double statusBarHeight = mediaQueryData.padding.top;
final double appBarHeight = AppBar().preferredSize.height;
final double tabBarHeight = 60;
final double screenWidth = mediaQueryData.size.width;
final double screenHeight = mediaQueryData.size.height;
final double keyboardHeight = screenHeight - mediaQueryData.viewInsets.bottom;
final double screenBottom = mediaQueryData.viewPadding.bottom == 0 ? 20 : 35;
final double sheetBottom = 40;
