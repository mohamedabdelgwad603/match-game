import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/cubit/game_cubit.dart';
import 'package:game/cubit/timer/timer_states.dart';
import 'package:game/models/item_model.dart';
import 'package:game/services/audio_play_sevice.dart';
import 'package:game/widgets/custom_app_bar.dart';
import 'package:game/widgets/finish_snack_bar.dart';
import 'package:game/widgets/start_snack_Bar.dart';
import 'package:game/widgets/svg_image_positioned.dart';

import '../cubit/timer/timer_cubit.dart';

class DragAndDropGameScreen extends StatefulWidget {
  final bool isArabic;

  const DragAndDropGameScreen({super.key, required this.isArabic});

  @override
  State<DragAndDropGameScreen> createState() => _DragAndDropGameScreenState();
}

class _DragAndDropGameScreenState extends State<DragAndDropGameScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    TimerCubit.get(context).startTimer();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GameCubit.get(context);
          return GestureDetector(
            onTap: TimerCubit.get(context).startTimer,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: cubit.isPlay
                      ? Column(
                          //  mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomAppBar(
                              isArabic: widget.isArabic,
                            ),
                            Expanded(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 60.h,
                                        width: 20.w,
                                        child: BlocBuilder<TimerCubit,
                                                TimerStates>(
                                            builder: (context, stat) {
                                          return TimerCubit.get(context)
                                                      .counter !=
                                                  0
                                              ? SvgPicture.asset(
                                                  'assets/svg/leftB.svg')
                                              : SizedBox();
                                        }),
                                      ),

                                      // dragable items section
                                      Expanded(
                                          child: Stack(
                                              children: List.generate(
                                                  cubit.items.length, (index) {
                                        return Positioned(
                                          left: cubit.items[index].left,
                                          right: cubit.items[index].right,
                                          top: cubit.items[index].top,
                                          bottom: cubit.items[index].bottom,
                                          child: AnimatedScale(
                                            scale: 1.2,
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
                                                      width: 60.w,
                                                      height: 60.h,
                                                    )
                                                  : const SizedBox(),
                                              childWhenDragging:
                                                  SvgPicture.asset(
                                                cubit.items[index].img,
                                                width: 60.w,
                                                height: 60.h,
                                              ),
                                              child: SvgImagePositioned(
                                                image: cubit.items[index].img,
                                                seconds:
                                                    cubit.items[index].delay,
                                              ),
                                            ),
                                          ),
                                        );
                                      }))),

                                      //dragable target section
                                      Expanded(
                                          child: Stack(
                                              children: List.generate(
                                                  cubit.itemsShadow.length,
                                                  (index) {
                                        return Positioned(
                                          //     key: Key('${item.delay}'),
                                          left: cubit.itemsShadow[index].left,
                                          right: cubit.itemsShadow[index].right,
                                          top: cubit.itemsShadow[index].top,
                                          bottom:
                                              cubit.itemsShadow[index].bottom,
                                          child: AnimatedScale(
                                            scale: 1.2,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: DragTarget<Item>(
                                              onAcceptWithDetails:
                                                  cubit.isDragEnabled
                                                      ? (recivedItem) {
                                                          cubit.onAccept(
                                                              recivedItem,
                                                              cubit.itemsShadow[
                                                                  index],
                                                              index);
                                                        }
                                                      : null,
                                              builder: (context, acceptedItems,
                                                      rejectedItems) =>
                                                  SvgImagePositioned(
                                                image: cubit
                                                    .itemsShadow[index].img,
                                                seconds: cubit
                                                    .itemsShadow[index].delay,
                                              ),
                                            ),
                                          ),
                                        );
                                      }))),
                                      SizedBox(
                                        height: 60.h,
                                        width: 20.w,
                                        child: BlocBuilder<TimerCubit,
                                                TimerStates>(
                                            builder: (context, stat) {
                                          return TimerCubit.get(context)
                                                      .counter !=
                                                  0
                                              ? SvgPicture.asset(
                                                  'assets/svg/rightB.svg')
                                              : const SizedBox();
                                        }),
                                      ),
                                    ],
                                  ),
                                  if (cubit.score == 8)
                                    FinishSnackBar(
                                      cubit: cubit,
                                      isArabic: widget.isArabic,
                                    )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                margin:
                                    EdgeInsets.only(left: 20.w, bottom: 5.h),
                                alignment: Alignment.bottomLeft,
                                child: BlocBuilder<TimerCubit, TimerStates>(
                                    builder: (context, stat) {
                                  return TimerCubit.get(context).counter != 0
                                      ? CustomButton(
                                          onPressed: () {
                                            cubit.toggleDrag();
                                            TimerCubit.get(context).stopTimer();
                                          },
                                          img: 'assets/svg/stop.svg')
                                      : const SizedBox();
                                }),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        )
                      : StartSnackBar(cubit: cubit, isArabic: widget.isArabic),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
