import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/features/game/screens/drag_and_drop_game_screen.dart';

import '../../../../core/themes/colors.dart';
import '../../../game/widgets/custom_elevated_button.dart';
import '../widgets/change_language_text.dart';
import '../widgets/languages_list/languages_list.dart';
import '../widgets/logo_component.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final bool isUpdateProfile;
  const LanguageSelectionScreen({super.key, this.isUpdateProfile = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            const LogoComponent(),
            SizedBox(height: 10.h),
            const ChangeLanguageText(),
            SizedBox(height: 20.h),
            Expanded(
              child: LanguagesList(),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
                backgroundColor: ColorManager.secondary,
                onPressed: () {
                  // TODO: uncomment this line
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DragAndDropGameScreen()));
                  //      Navigator.pushReplacementNamed(context, PageName.systemTypes);
                },
                text: context.tr('next'))
          ],
        ),
      ),
    );
  }
}
