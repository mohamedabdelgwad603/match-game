import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String img;

  const CustomButton({super.key, this.onPressed, required this.img});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: SvgPicture.asset(
          'assets/svg/back.svg',
          width: 50.w,
          height: 30..h,
        ));
  }
}
