import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

// TextStyle textStyle30({Color color =ColorManager.titleColor, FontWeight fontWeight=FontWeight.w700}) {
//   return  TextStyle(
//     color: color,
//      fontSize: 30,
//      fontWeight: fontWeight
//   );
// }
// TextStyle textStyle30({Color color =ColorManager.titleColor, FontWeight fontWeight=FontWeight.w700}) {
//   return  TextStyle(
//     color: color,
//      fontSize: 30,
//      fontWeight: fontWeight
//   );
// }

TextStyle _getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      decorationColor: const Color.fromRGBO(131, 145, 161, 1),
      fontWeight: fontWeight);
}

//light style
TextStyle getLightStyle(
    {double fontSize = 16, Color color = const Color(0xFF556676)}) {
  return _getTextStyle(fontSize.sp, color, FontWeight.w300);
}
// // regular style

TextStyle getRegularStyle(
    {double fontSize = 16, Color color = const Color(0xFF353F58)}) {
  return _getTextStyle(fontSize.sp, color, FontWeight.w400);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = 15, Color color = ColorManager.greyLight}) {
  return _getTextStyle(
    fontSize.sp,
    color,
    FontWeight.w500,
  );
}

// TextStyle getLight2Style({double fontSize = 12, required Color color}) {
//   return _getTextStyle(fontSize, color, FontWeight.w500);
// }

// bold style

TextStyle getBoldStyle(
    {double fontSize = 26, Color color = ColorManager.boldTextColor}) {
  return _getTextStyle(fontSize.sp, color, FontWeight.w700);
}
// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = 20, Color color = ColorManager.greyColor2}) {
  return _getTextStyle(fontSize.sp, color, FontWeight.w600);
}

TextStyle getButtonTextStyle(
    {double fontSize = 15,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w600}) {
  return _getTextStyle(fontSize.sp, color, fontWeight);
}

TextStyle getSmallBoldStyle({double fontSize = 15, required Color color}) {
  return _getTextStyle(fontSize.sp, color, FontWeight.w600);
}
