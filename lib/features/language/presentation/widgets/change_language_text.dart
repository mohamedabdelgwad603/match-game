import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/Material.dart';


import '../../../../core/themes/text_manager.dart';


class ChangeLanguageText extends StatelessWidget {
const   ChangeLanguageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(TextManager.changeLanguage),
      style:const TextStyle(
        fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
    );
  }
}
