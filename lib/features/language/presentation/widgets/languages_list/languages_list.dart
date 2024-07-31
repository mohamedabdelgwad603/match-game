import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/language_entity.dart';
import '../../../../../core/themes/assets_manager.dart';
import '../../../../../core/themes/text_manager.dart';
import 'language_component/language_component.dart';

class LanguagesList extends StatelessWidget {
   LanguagesList({super.key});
final List<LanguageEntity> languages = [
  LanguageEntity(
    languageName: TextManager.arabic,
    languageCode: 'ar',
    languageIcon: AssetsManager.kwait,
  ),
  LanguageEntity(
    languageName: TextManager.english,
    languageCode: 'en',
    languageIcon: AssetsManager.usa,
  ),
];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, i) => SizedBox(height: 20.h),
      itemCount: languages.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.setLocale(Locale(languages[index].languageCode));
          
        },
        child: LanguageComponent(languageEntity: languages[index]),
      ),
    );
  }
}
