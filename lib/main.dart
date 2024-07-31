import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/themes/themes.dart';
import 'package:game/features/language/presentation/screens/language_selection_screen.dart';

import 'features/game/cubit/timer/timer_cubit.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp()));
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(500, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(create:(context)=>TimerCubit(),
      child:MaterialApp( 
            localizationsDelegates: context.localizationDelegates, 
          supportedLocales: context.supportedLocales, 
          locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: const LanguageSelectionScreen(), 
        theme: AppTheme.light,
      ), 
      )
      
      
    );
  }
}
