import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'timer_states.dart';

class TimerCubit extends Cubit<TimerStates> {
  int counter = 0;
  Timer? timer;

  TimerCubit() : super(TimerInitial());

  static TimerCubit get(context) => BlocProvider.of<TimerCubit>(context);

  void startTimer() {
    stopTimer();

    counter = 5;
    emit(TimerState());
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (tim) {
        if (counter > 0) {
          counter--;
          // kprint("Timer $counter");
          emit(TimerState());
        } else {
          stopTimer();
        }
      },
    );
  }

  void stopTimer() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
      counter = 0;
      log("Timer Cancelled");
      emit(TimerState());
    }
  }
}
