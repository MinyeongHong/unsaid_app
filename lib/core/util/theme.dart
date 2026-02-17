import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unsaid_app/core/util/color.dart';

class CustomThemeData {
  static ThemeData get init => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CustomColor.primary,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
  );
}
