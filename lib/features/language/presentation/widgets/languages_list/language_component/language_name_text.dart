import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/themes/text_style.dart';

class LanguageNameText extends StatelessWidget {
  final String languageName;
  const LanguageNameText({super.key, required this.languageName});

  @override
  Widget build(BuildContext context) {
    return Text(context.tr(languageName),
        style: getRegularStyle()
            .copyWith()
            .copyWith(fontSize: isTablet ? 11.sp : 12.sp));
  }
}
