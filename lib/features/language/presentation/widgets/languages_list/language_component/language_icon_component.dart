import 'package:flutter/Material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants.dart';

class LanguageIconComponent extends StatelessWidget {
  final String icon;
  const LanguageIconComponent({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30.w,
        height: isTablet ? 40.h : 30.h,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(
            child: SvgPicture.asset(
          icon,
          fit: BoxFit.cover,
        )));
  }
}
