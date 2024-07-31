import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/themes/colors.dart';

import '../../../core/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double size;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final double width;
  final double height;
  final bool shadow;
  final bool isDisabled;
  final bool isLoading;
  final AlignmentGeometry buttonAlignment;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.buttonAlignment = Alignment.center,
    this.width = 1,
    this.shadow = false,
    this.height = 60,
    this.borderRadius = 16,
    this.borderColor = ColorManager.secondary,
    required this.text,
    this.textColor = ColorManager.whiteColor,
    this.backgroundColor = ColorManager.secondary,
    this.size = 16,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isTablet ? 65.h : height.h,
      width: width == 1 ? width.sw : width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        // side: WidgetStatePropertyAll(
        //   BorderSide(
        //     color: ColorManager.transparent,
        //     width: 1.5.sp,
        //   ),
        // ),
        // ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: isTablet ? 8.sp : size.sp,
              color: textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
