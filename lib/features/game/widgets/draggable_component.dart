import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants.dart';
import '../cubit/game_cubit.dart';
import '../cubit/timer/timer_cubit.dart';
import '../../../core/models/item_model.dart';
import '../../../core/services/audio_play_sevice.dart';
import 'svg_image_positioned.dart';

class DraggableComponanet extends StatelessWidget {
  const DraggableComponanet({
    super.key,
    required this.cubit,
  });

  final GameCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
            children: List.generate(
                cubit.items.length, (index) {
      return Positioned(
        left: cubit.items[index].left,
        right: cubit.items[index].right,
        top: cubit.items[index].top,
        bottom: cubit.items[index].bottom,
        child: AnimatedScale(
          scale: isTablet ? 2 : 1.2,
          duration: const Duration(
              milliseconds: 300),
          child: Draggable<Item>(
            onDragStarted: cubit.isDragEnabled
                ? () {
                    AudioPlayService
                        .playSound(
                            'audio/drag.mp3');
                    TimerCubit.get(context)
                        .startTimer();
                  }
                : null,
            onDraggableCanceled: (v, o) {
              cubit.onDraggableCanceled();
            },
            data: cubit.items[index],
            feedback: cubit.isDragEnabled
                ? SvgPicture.asset(
                    cubit.items[index].img,
                    width: 40.w,
                    height: 40.h,
                  )
                : const SizedBox(),
            childWhenDragging: !cubit
                    .isDragEnabled
                ? SvgPicture.asset(
                    cubit.items[index].img,
                    width: 60.w,
                    height: 60.h,
                  )
                : const SizedBox(),
            child: SvgImagePositioned(
              image: cubit.items[index].img,
              seconds:
                  cubit.items[index].delay,
            ),
          ),
        ),
      );
    })));
  }
}


