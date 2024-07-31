
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/timer/timer_cubit.dart';
import '../cubit/timer/timer_states.dart';

class CustomBackButton extends StatelessWidget {
  final String img;

  const CustomBackButton({super.key, required this.img});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 20.w,
      child: BlocBuilder<TimerCubit, TimerStates>(builder: (context, stat) {
        return TimerCubit.get(context).counter != 0
            ? SvgPicture.asset(img)
            : const SizedBox();
      }),
    );
  }
}