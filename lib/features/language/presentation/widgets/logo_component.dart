import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.locale.languageCode == 'ar'
          ? 'assets/svg/matchA.svg'
          : 'assets/svg/match.svg',
      height: 50.h,
      width: 50.w,
    );
  }
}
