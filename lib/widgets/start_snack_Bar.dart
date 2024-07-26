import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/cubit/game_cubit.dart';
import 'package:game/services/audio_play_sevice.dart';

class StartSnackBar extends StatefulWidget {
  final bool isArabic;
  final GameCubit cubit;

  const StartSnackBar({super.key, required this.isArabic, required this.cubit});

  @override
  State<StartSnackBar> createState() => _StartSnackBarState();
}

class _StartSnackBarState extends State<StartSnackBar> {
  double turns = 0;

  @override
  void initState() {
    AudioPlayService.playSound('audio/start.mp3');
    Future.delayed(
        const Duration(seconds: 1),
        () => setState(() {
              turns = 1;
            }));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   _changeRotation();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => AnimationCubit().changeRotation());
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: SvgPicture.asset(
              'assets/svg/snackrectangle.svg',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    widget.isArabic
                        ? 'assets/svg/matchA.svg'
                        : 'assets/svg/match.svg',
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
              FadeInLeft(
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    widget.isArabic
                        ? 'assets/svg/titleA.svg'
                        : 'assets/svg/title.svg',
                    width: 70.w,
                    height: 70.h,
                  ),
                ),
              ),
              FadeInUp(
                child: InkWell(
                  onTap: () {
                    widget.cubit.changePlay();
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 7),
                    child: SvgPicture.asset(
                      'assets/svg/butt.svg',
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
