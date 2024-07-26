import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/screens/drag_and_drop_arabic_screen.dart';
import 'package:game/screens/drag_and_drop_game_screen.dart';
import 'package:game/widgets/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButon(
                title: 'Arabic',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxt) =>
                              const DragAndDropGameArabicScreen(
                                isArabic: true,
                              )));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButon(
                title: 'English',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxt) => const DragAndDropGameScreen(
                                isArabic: false,
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
