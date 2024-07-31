import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    fontFamily: 'Lemonada',
    scaffoldBackgroundColor: ColorManager.whiteColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ColorManager.whiteColor,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorManager.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: ColorManager.whiteColor),
      ),
    ),
    useMaterial3: true,
  );
}
