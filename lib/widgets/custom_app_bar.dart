import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/cubit/game_cubit.dart';

class CustomAppBar extends StatefulWidget {
  final bool isArabic;

  const CustomAppBar({super.key, required this.isArabic});
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
          return SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                //back  button
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  img: widget.isArabic
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
                        widget.isArabic
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
                      padding: EdgeInsets.only(left: 5.w),
                      margin: EdgeInsets.only(right: 5.w, top: 5.h),
                      width: 150.w,
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
                                                                  ? double
                                                                      .infinity
                                                                      .w
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
                      height: 40.h,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/pot.svg',
                          ),
                          Positioned(
                            bottom: 2.h,
                            child: Container(
                              width: 17.w,
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
                                                              ? double
                                                                  .infinity.h
                                                              : 0,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(7)),
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
            ),
          );
        });
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String img;

  const CustomButton({super.key, this.onPressed, required this.img});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: SvgPicture.asset(
          img,
          width: 50.w,
          height: 40..h,
        ));
  }
}
