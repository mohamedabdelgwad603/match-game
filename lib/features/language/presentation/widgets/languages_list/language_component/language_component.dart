import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/models/language_entity.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../game/widgets/custom_radio_button.dart';
import 'language_icon_component.dart';
import 'language_name_text.dart';

class LanguageComponent extends StatelessWidget {
  final LanguageEntity languageEntity;
  const LanguageComponent({super.key, required this.languageEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 20.w,
          top: isTablet ? 20.h : 0,
          bottom: isTablet ? 20.h : 0,
          end: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: context.locale.languageCode == languageEntity.languageCode
                ? ColorManager.secondary
                : ColorManager.greyColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LanguageIconComponent(icon: languageEntity.languageIcon),
              SizedBox(
                width: 10.w,
              ),
              LanguageNameText(languageName: languageEntity.languageName),
            ],
          ),
          CustomRadioButton(
            value: languageEntity.languageCode,
            groupValue: context.locale.languageCode,
            onChanged: (value) {
              context.setLocale(Locale(value.toString()));
            },
          ),
        ],
      ),
    );
  }
}
