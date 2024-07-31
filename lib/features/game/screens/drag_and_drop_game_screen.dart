import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/features/game/cubit/game_cubit.dart';

import 'package:game/features/game/widgets/custom_app_bar.dart';
import 'package:game/features/game/widgets/finish_snack_bar.dart';
import 'package:game/features/game/widgets/start_snack_Bar.dart';

import '../cubit/timer/timer_cubit.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/drag_target.component.dart';
import '../widgets/draggable_component.dart';
import '../widgets/stop_and_start_button.dart';

class DragAndDropGameScreen extends StatefulWidget {
  const DragAndDropGameScreen({
    super.key,
  });

  @override
  State<DragAndDropGameScreen> createState() => _DragAndDropGameScreenState();
}

class _DragAndDropGameScreenState extends State<DragAndDropGameScreen>
    with TickerProviderStateMixin {
  List<Offset> positions =
      List.generate(8, (index) => Offset(100.0, 100.0 * (index + 1)));
  List<bool> accepted = List.generate(8, (index) => false);
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      controllers.add(AnimationController(
        duration:const Duration(milliseconds: 100),
        vsync: this,
      ));

      animations.add(Tween<double>(
        begin: 1,
        end: .8,
      ).animate(
        CurvedAnimation(
          parent: controllers[i],
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controllers[i].reverse();
          }
        }));
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: context.locale.languageCode == 'ar'
                      ? const AssetImage("assets/images/bgA.png")
                      : const AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: cubit.isPlay
                    ? Column(
                        //  mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomAppBar(),
                          Expanded(
                            child: SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Row(
                                    children: [
                                      //left backButton
                                      CustomBackButton(
                                        img: context.locale.languageCode == 'ar'
                                            ? 'assets/svg/rightB.svg'
                                            : 'assets/svg/leftB.svg',
                                      ),

                                      // dragable items section
                                      DraggableComponanet(cubit: cubit),

                                      //dragable target section
                                      DragTargetComponent(
                                          cubit: cubit,
                                          controllers: controllers,
                                          animations: animations),

                                      // right backButton
                                      Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: CustomBackButton(
                                            img: context.locale.languageCode ==
                                                    'ar'
                                                ? 'assets/svg/leftB.svg'
                                                : 'assets/svg/rightB.svg'),
                                      ),
                                    ],
                                  ),
                                  if (cubit.score == 8)
                                    FinishSnackBar(
                                      cubit: cubit,
                                    )
                                ],
                              ),
                            ),
                          ),
                          // stop and start button
                          StopandStartButton(cubit: cubit),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      )
                    : StartSnackBar(
                        cubit: cubit,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
