import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/models/item_model.dart';
import 'package:game/services/audio_play_sevice.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());
  bool isPlay = false;
  int score = 0;
  bool isAccept = false;
  bool isDragEnabled = true;

  void toggleDrag() {
    isDragEnabled = !isDragEnabled;
    emit(ToggleDragState());
  }

  static GameCubit get(context) => BlocProvider.of<GameCubit>(context);
  List<Item> items = [
    Item(
        name: 'bag',
        img: 'assets/svg/bag.svg',
        delay: 1350,
        top: 70.h,
        left: 20.w),
    Item(
      name: 'apple',
      img: 'assets/svg/apple.svg',
      delay: 1500,
      top: 20.h,
      right: 100.w,
    ),
    Item(
      name: 'earth',
      img: 'assets/svg/earth.svg',
      delay: 1650,
      top: 60.h,
      right: 20.w,
    ),
    Item(
      name: 'strab',
      img: 'assets/svg/strab.svg',
      delay: 1800,
      bottom: 10.h,
      left: 20.w,
    ),
    Item(
      name: 'note',
      img: 'assets/svg/note.svg',
      delay: 1950,
      bottom: 10.h,
      right: 20.w,
    ),
    Item(
      name: 'orange',
      img: 'assets/svg/orange.svg',
      delay: 2100,
      bottom: 15.h,
      right: 100.w,
    ),
    Item(
      name: 'ruler',
      img: 'assets/svg/ruler.svg',
      delay: 2250,
      bottom: 100.h,
      left: 80.w,
    ),
    Item(
      name: 'pencil',
      img: 'assets/svg/pencil.svg',
      delay: 2400,
      bottom: 90.h,
      left: 140.w,
    ),
  ];
  List<Item> itemsShadow = [
    Item(
        name: 'bag',
        img: 'assets/svg/bag1.svg',
        delay: 150,
        top: 70.h,
        left: 20.w),
    Item(
      name: 'apple',
      img: 'assets/svg/apple1.svg',
      delay: 300,
      top: 20.h,
      right: 100.w,
    ),
    Item(
      name: 'earth',
      img: 'assets/svg/earth1.svg',
      delay: 450,
      top: 60.h,
      right: 20.w,
    ),
    Item(
      name: 'strab',
      img: 'assets/svg/strab1.svg',
      delay: 600,
      bottom: 10.h,
      left: 20.w,
    ),
    Item(
      name: 'note',
      img: 'assets/svg/note1.svg',
      delay: 750,
      bottom: 10.h,
      right: 20.w,
    ),
    Item(
      name: 'orange',
      img: 'assets/svg/orange1.svg',
      delay: 900,
      bottom: 15.h,
      right: 100.w,
    ),
    Item(
      name: 'ruler',
      img: 'assets/svg/ruler1.svg',
      delay: 1050,
      bottom: 100.h,
      left: 80.w,
    ),
    Item(
      name: 'pencil',
      img: 'assets/svg/pencil1.svg',
      delay: 1200,
      bottom: 90.h,
      left: 140.w,
    ),
  ];
  // onRejct() {
  //   isAccept = false;
  //   print(isAccept);
  //   emit(onRejct());
  // }

  onAccept(DragTargetDetails<Item> recivedItem, Item item, int index) {
    if (recivedItem.data.name == item.name) {
      AudioPlayService.playSound('audio/correct.mp3');
      isAccept = true;
      items.remove(recivedItem.data);
      itemsShadow.remove(item);
      itemsShadow.insert(index, recivedItem.data);
      // print(itemsShadow[index].img);

      score += 1;
      if (score == 8) {
        AudioPlayService.playSound('audio/finish.mp3');
      }
      emit(GameOnAccept());
    } else {
      AudioPlayService.playSound('audio/mistake.mp3');
      isAccept = false;
      //   emit(GameOnReject());
    }
  }

  changePlay() {
    isPlay = true;
    emit(GameIsPlaying());
  }

  playAgain() {
    score = 0;

    items = [
      Item(
          name: 'bag',
          img: 'assets/svg/bag.svg',
          delay: 1350,
          top: 70.h,
          left: 20.w),
      Item(
        name: 'apple',
        img: 'assets/svg/apple.svg',
        delay: 1500,
        top: 20.h,
        right: 100.w,
      ),
      Item(
        name: 'earth',
        img: 'assets/svg/earth.svg',
        delay: 1650,
        top: 60.h,
        right: 20.w,
      ),
      Item(
        name: 'strab',
        img: 'assets/svg/strab.svg',
        delay: 1800,
        bottom: 10.h,
        left: 20.w,
      ),
      Item(
        name: 'note',
        img: 'assets/svg/note.svg',
        delay: 1950,
        bottom: 10.h,
        right: 20.w,
      ),
      Item(
        name: 'orange',
        img: 'assets/svg/orange.svg',
        delay: 2100,
        bottom: 15.h,
        right: 100.w,
      ),
      Item(
        name: 'ruler',
        img: 'assets/svg/ruler.svg',
        delay: 2250,
        bottom: 100.h,
        left: 80.w,
      ),
      Item(
        name: 'pencil',
        img: 'assets/svg/pencil.svg',
        delay: 2400,
        bottom: 90.h,
        left: 140.w,
      ),
    ];
    itemsShadow = [
      Item(
          name: 'bag',
          img: 'assets/svg/bag1.svg',
          delay: 150,
          top: 70.h,
          left: 20.w),
      Item(
        name: 'apple',
        img: 'assets/svg/apple1.svg',
        delay: 300,
        top: 20.h,
        right: 100.w,
      ),
      Item(
        name: 'earth',
        img: 'assets/svg/earth1.svg',
        delay: 450,
        top: 60.h,
        right: 20.w,
      ),
      Item(
        name: 'strab',
        img: 'assets/svg/strab1.svg',
        delay: 600,
        bottom: 10.h,
        left: 20.w,
      ),
      Item(
        name: 'note',
        img: 'assets/svg/note1.svg',
        delay: 750,
        bottom: 10.h,
        right: 20.w,
      ),
      Item(
        name: 'orange',
        img: 'assets/svg/orange1.svg',
        delay: 900,
        bottom: 15.h,
        right: 100.w,
      ),
      Item(
        name: 'ruler',
        img: 'assets/svg/ruler1.svg',
        delay: 1050,
        bottom: 100.h,
        left: 80.w,
      ),
      Item(
        name: 'pencil',
        img: 'assets/svg/pencil1.svg',
        delay: 1200,
        bottom: 90.h,
        left: 140.w,
      ),
    ];
    emit(PlayAgain());
  }

  onDraggableCanceled() {
    emit(GameOnReject());
  }
}
