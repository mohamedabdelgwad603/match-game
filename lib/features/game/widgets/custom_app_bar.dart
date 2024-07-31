import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/features/game/cubit/game_cubit.dart';

import '../../../core/constants.dart';
import 'custom_button.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isHelp = false;

  changeIsHelp() {
    setState(() {
      isHelp = !isHelp;
    });
    // emit(IsHelpChanged());
  }

  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GameCubit.get(context);
          return Row(
            children: [
              //back  button
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                img: context.locale.languageCode == 'ar'
                    ? 'assets/svg/backA.svg'
                    : 'assets/svg/back.svg',
              ),
              const SizedBox(
                width: 5,
              ),
              //help buttoon
              CustomButton(
                onPressed: changeIsHelp,
                img: 'assets/svg/help.svg',
              ),

              if (isHelp)
                FadeInLeft(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 5.h),
                    width: 200.w,
                    // height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),

                    child: Text(
                      context.locale.languageCode == 'ar'
                          ? "طابق الصور مع صورهم الظلية"
                          : "Match the pictures to their silhouettes",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              const Spacer(),
              //score container

              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: context.locale.languageCode == 'en' ? 5.w : 0,
                        right: context.locale.languageCode == 'ar' ? 5.w : 0),
                    margin: EdgeInsets.only(right: 5.w, top: 5.h),
                    width: 180.w,
                    // height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Row(
                      children: [
                        Text(
                          "${cubit.score}/8",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: cubit.score == 1
                                    ? 15.w
                                    : cubit.score == 2
                                        ? 30.w
                                        : cubit.score == 3
                                            ? 45.w
                                            : cubit.score == 4
                                                ? 60.w
                                                : cubit.score == 5
                                                    ? 75.w
                                                    : cubit.score == 6
                                                        ? 90.w
                                                        : cubit.score == 7
                                                            ? 105.w
                                                            : cubit.score == 8
                                                                ? 120.w
                                                                : 0,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //pot score
                  SizedBox(
                    height: isTablet ? 60.h : 40.h,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/pot.svg',
                        ),
                        Positioned(
                          bottom: 2.h,
                          child: Container(
                            width: 14.w,
                            height: cubit.score == 1
                                ? 3.h
                                : cubit.score == 2
                                    ? 6.h
                                    : cubit.score == 3
                                        ? 9.h
                                        : cubit.score == 4
                                            ? 12.h
                                            : cubit.score == 5
                                                ? 15.h
                                                : cubit.score == 6
                                                    ? 18.h
                                                    : cubit.score == 7
                                                        ? 21.h
                                                        : cubit.score == 8
                                                            ? 24.h
                                                            : 0,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/svg/checkk.svg',
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}


