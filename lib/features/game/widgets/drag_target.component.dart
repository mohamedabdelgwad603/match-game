import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../cubit/game_cubit.dart';
import '../../../core/models/item_model.dart';
import 'svg_image_positioned.dart';

class DragTargetComponent extends StatelessWidget {
  const DragTargetComponent({
    super.key,
    required this.cubit,
    required this.controllers,
    required this.animations,
  });

  final GameCubit cubit;
  final List<AnimationController> controllers;
  final List<Animation<double>> animations;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
            children: List.generate(
                cubit.itemsShadow.length,
                (index) {
      return Positioned(
          //     key: Key('${item.delay}'),
          left: cubit.itemsShadow[index].left,
          right:
              cubit.itemsShadow[index].right,
          top: cubit.itemsShadow[index].top,
          bottom:
              cubit.itemsShadow[index].bottom,
          child: AnimatedScale(
            scale: isTablet ? 2 : 1.2,
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
    
                          controllers[index]
                              .forward();
                        }
                      : null,
              builder: (context,
                      acceptedItems,
                      rejectedItems) =>
                  (cubit.isAccept &&
                          cubit.id ==
                              cubit
                                  .itemsShadow[
                                      index]
                                  .id)
                      ? AnimatedBuilder(
                          animation: controllers.any(
                                  (controller) =>
                                      controller
                                          .isAnimating)
                              ? Listenable.merge(
                                  controllers)
                              : const AlwaysStoppedAnimation(
                                  0),
                          builder: (context,
                              child) {
                            return Transform
                                .scale(
                              scale: (cubit
                                          .isAccept &&
                                      cubit.id ==
                                          cubit
                                              .itemsShadow[
                                                  index]
                                              .id)
                                  ? animations[
                                          index]
                                      .value
                                  : 1.0,
                              child:
                                  SvgImagePositioned(
                                image: cubit
                                    .itemsShadow[
                                        index]
                                    .img,
                                seconds: cubit
                                    .itemsShadow[
                                        index]
                                    .delay,
                              ),
                            );
                          },
                        )
                      : SvgImagePositioned(
                          image: cubit
                              .itemsShadow[
                                  index]
                              .img,
                          seconds: cubit
                              .itemsShadow[
                                  index]
                              .delay,
                        ),
            ),
          ));
    })));
  }
}