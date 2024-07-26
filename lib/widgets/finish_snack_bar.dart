// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:game/cubit/game_cubit.dart';

class FinishSnackBar extends StatelessWidget {
  final GameCubit cubit;
  final bool isArabic;

  const FinishSnackBar(
      {super.key, required this.cubit, required this.isArabic});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
      child: FadeInLeft(
        child: MaterialButton(
          onPressed: () {
            cubit.playAgain();
          },
          child: Stack(
            //  alignment: AlignmentDirectional.topCenter,
            children: [
              SvgPicture.asset(
                isArabic ? 'assets/svg/finishA.svg' : 'assets/svg/finish.svg',
                // width: MediaQuery.of(context).size.width * .6,
                // height: MediaQuery.of(context).size.height * .8,
              ),
              SvgPicture.asset(
                'assets/svg/sprite.svg',
                width: 80.w,
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
