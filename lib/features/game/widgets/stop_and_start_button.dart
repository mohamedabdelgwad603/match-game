import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/features/game/cubit/timer/timer_cubit.dart';

import '../cubit/game_cubit.dart';
import '../cubit/timer/timer_states.dart';
import 'custom_button.dart';

class StopandStartButton extends StatelessWidget {
  const StopandStartButton({
    super.key,
    required this.cubit,
  });

  final GameCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: context.locale.languageCode == 'ar'
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      child: Container(
        height: 40.h,
        width: 40.w,
        margin: context.locale.languageCode == 'ar'
            ? EdgeInsets.only(right: 10.w, bottom: 5.h)
            : EdgeInsets.only(left: 10.w, bottom: 5.h),
        alignment: Alignment.bottomLeft,
        child: BlocBuilder<TimerCubit, TimerStates>(
            builder: (context, stat) {
          return TimerCubit.get(context).counter != 0
              ? CustomButton(
                  onPressed: () {
                    cubit.toggleDrag();
                  },
                  img: cubit.isDragEnabled
                      ? 'assets/svg/stop.svg'
                      : 'assets/svg/butt.svg')
              : const SizedBox();
        }),
      ),
    );
  }
}



