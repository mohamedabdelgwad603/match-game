import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game/cubit/game_cubit.dart';

class SvgImagePositioned extends StatefulWidget {
  final String image;

  final int seconds;

  const SvgImagePositioned({
    super.key,
    required this.image,
    required this.seconds,
  });

  @override
  State<SvgImagePositioned> createState() => _SvgImagePositionedState();
}

class _SvgImagePositionedState extends State<SvgImagePositioned>
     {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GameOnAccept || state is GameOnReject || state is ToggleDragState ) {
            return SvgPicture.asset(
              widget.image,
              width: 60.w,
              height: 60.h,
            );
          }

          return DelayedDisplay(
            delay: Duration(milliseconds: widget.seconds),
            fadingDuration: const Duration(milliseconds: 100),
            child: SvgPicture.asset(
              widget.image,
              width: 60.w,
              height: 60.h,
            ),
          );
        });
  }
}
