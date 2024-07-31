import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/features/game/cubit/game_cubit.dart';
import 'package:game/core/models/item_model.dart';
import 'package:game/core/services/audio_play_sevice.dart';
import 'package:game/features/game/widgets/custom_app_bar.dart';
import 'package:game/features/game/widgets/finish_snack_bar.dart';
import 'package:game/features/game/widgets/start_snack_Bar.dart';
import 'package:game/features/game/widgets/svg_image_positioned.dart';

import '../widgets/custom_button.dart';

class DragAndDropGameArabicScreen extends StatelessWidget {
  final bool isArabic;

  const DragAndDropGameArabicScreen({super.key, required this.isArabic});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(),
      child: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GameCubit.get(context);
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgA.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: cubit.isPlay
                      ? cubit.score == 8
                          ? FinishSnackBar(
                              cubit: cubit,
                            )
                          : Column(
                              //  mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                const CustomAppBar(),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const CustomButton(
                                          img: 'assets/svg/rightB.svg'),
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
                                          child: Draggable<Item>(
                                            data: cubit.items[index],
                                            onDragStarted: () {
                                              AudioPlayService.playSound(
                                                  'audio/drag.mp3');
                                            },
                                            onDraggableCanceled: (v, o) {
                                              cubit.onDraggableCanceled();
                                            },
                                            feedback: SvgPicture.asset(
                                              cubit.items[index].img,
                                              width: 60.w,
                                              height: 60.h,
                                            ),
                                            childWhenDragging: SvgPicture.asset(
                                              cubit.items[index].img,
                                              width: 60.w,
                                              height: 60.h,
                                            ),
                                            child: SvgImagePositioned(
                                              image: cubit.items[index].img,
                                              seconds: cubit.items[index].delay,
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
                                          child: DragTarget<Item>(
                                            onAcceptWithDetails: (recivedItem) {
                                              cubit.onAccept(
                                                  recivedItem,
                                                  cubit.itemsShadow[index],
                                                  index);
                                            },
                                            builder: (context, acceptedItems,
                                                    rejectedItems) =>
                                                SvgImagePositioned(
                                              image:
                                                  cubit.itemsShadow[index].img,
                                              seconds: cubit
                                                  .itemsShadow[index].delay,
                                            ),
                                          ),
                                        );
                                      })
                                              //     cubit.itemsShadow.map(
                                              //   (item) {
                                              //     return Positioned(
                                              //       //     key: Key('${item.delay}'),
                                              //       left: item.left,
                                              //       right: item.right,
                                              //       top: item.top,
                                              //       bottom: item.bottom,
                                              //       child: DragTarget<Item>(
                                              //         onAcceptWithDetails:
                                              //             (recivedItem) {
                                              //           cubit.onAccept(
                                              //               recivedItem, item);
                                              //         },
                                              //         builder: (context, acceptedItems,
                                              //                 rejectedItems) =>
                                              //             SvgImagePositioned(
                                              //           image: item.img,
                                              //           seconds: item.delay,
                                              //         ),
                                              //       ),
                                              //     );
                                              //   },
                                              // ).toList()),
                                              )),
                                      const CustomButton(
                                          img: 'assets/svg/leftB.svg'),
                                    ],
                                  ),
                                ),
                              ],
                            )
                      : StartSnackBar(
                          cubit: cubit,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
