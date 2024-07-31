// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:game/features/game/cubit/game_cubit.dart';

class FinishSnackBar extends StatelessWidget {
  final GameCubit cubit;

  const FinishSnackBar({
    super.key,
    required this.cubit,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      child: FadeInLeft(
        child: GestureDetector(
          onTap: () {
            cubit.playAgain();
          },
          child: Stack(
            // alignment: AlignmentDirectional.topCenter,
            children: [
              SvgPicture.asset(
                context.locale.languageCode == 'ar'
                    ? 'assets/svg/finishA.svg'
                    : 'assets/svg/finish.svg',
                // width: MediaQuery.of(context).size.width * .5,
                // height: MediaQuery.of(context).size.height * .5,
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
