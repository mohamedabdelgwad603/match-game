import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/core/models/item_model.dart';
import 'package:game/core/services/audio_play_sevice.dart';

import '../../../core/constants.dart';

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
        id: 1,
        name: 'bag',
        img: 'assets/svg/bag.svg',
        delay: 1350,
        top: isTablet ? 150.h : 70.h,
        left: 20.w),
    Item(
      id: 2,
      name: 'apple',
      img: 'assets/svg/apple.svg',
      delay: 1500,
      top: isTablet ? 100.h : 20.h,
      right: 100.w,
    ),
    Item(
      id: 3,
      name: 'earth',
      img: 'assets/svg/earth.svg',
      delay: 1650,
      top: isTablet ? 150.h : 60.h,
      right: 20.w,
    ),
    Item(
      id: 4,
      name: 'strab',
      img: 'assets/svg/strab.svg',
      delay: 1800,
      bottom: isTablet ? 70.h : 10.h,
      left: 20.w,
    ),
    Item(
      id: 5,
      name: 'note',
      img: 'assets/svg/note.svg',
      delay: 1950,
      bottom: isTablet ? 90.h : 10.h,
      right: 20.w,
    ),
    Item(
      id: 6,
      name: 'orange',
      img: 'assets/svg/orange.svg',
      delay: 2100,
      bottom: isTablet ? 70.h : 15.h,
      right: 100.w,
    ),
    Item(
      id: 7,
      name: 'ruler',
      img: 'assets/svg/ruler.svg',
      delay: 2250,
      bottom: isTablet ? 230.h : 100.h,
      left: 80.w,
    ),
    Item(
      id: 8,
      name: 'pencil',
      img: 'assets/svg/pencil.svg',
      delay: 2400,
      bottom: isTablet ? 230.h : 90.h,
      left: 140.w,
    ),
  ];
  List<Item> itemsShadow = [
    Item(
        id: 9,
        name: 'bag',
        img: 'assets/svg/bag1.svg',
        delay: 150,
        top: isTablet ? 150.h : 70.h,
        left: 20.w),
    Item(
      id: 10,
      name: 'apple',
      img: 'assets/svg/apple1.svg',
      delay: 300,
      top: isTablet ? 100.h : 20.h,
      right: 100.w,
    ),
    Item(
      id: 11,
      name: 'earth',
      img: 'assets/svg/earth1.svg',
      delay: 450,
      top: isTablet ? 150.h : 60.h,
      right: 20.w,
    ),
    Item(
      id: 12,
      name: 'strab',
      img: 'assets/svg/strab1.svg',
      delay: 600,
      bottom: isTablet ? 70.h : 10.h,
      left: 20.w,
    ),
    Item(
      id: 13,
      name: 'note',
      img: 'assets/svg/note1.svg',
      delay: 750,
      bottom: isTablet ? 90.h : 10.h,
      right: 20.w,
    ),
    Item(
      id: 14,
      name: 'orange',
      img: 'assets/svg/orange1.svg',
      delay: 900,
      bottom: isTablet ? 70.h : 15.h,
      right: 100.w,
    ),
    Item(
      id: 15,
      name: 'ruler',
      img: 'assets/svg/ruler1.svg',
      delay: 1050,
      bottom: isTablet ? 230.h : 100.h,
      left: 80.w,
    ),
    Item(
      id: 16,
      name: 'pencil',
      img: 'assets/svg/pencil1.svg',
      delay: 1200,
      bottom: isTablet ? 230.h : 90.h,
      left: 140.w,
    ),
  ];
  // onRejct() {
  //   isAccept = false;
  //   print(isAccept);
  //   emit(onRejct());
  // }
  int id = 0;
  onAccept(DragTargetDetails<Item> recivedItem, Item item, int index) {
    id = recivedItem.data.id;
    
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
         emit(GameOnReject());
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
          id: 1,
          name: 'bag',
          img: 'assets/svg/bag.svg',
          delay: 1350,
          top: isTablet ? 150.h : 70.h,
          left: 20.w),
      Item(
        id: 2,
        name: 'apple',
        img: 'assets/svg/apple.svg',
        delay: 1500,
        top: isTablet ? 100.h : 20.h,
        right: 100.w,
      ),
      Item(
        id: 3,
        name: 'earth',
        img: 'assets/svg/earth.svg',
        delay: 1650,
        top: isTablet ? 150.h : 60.h,
        right: 20.w,
      ),
      Item(
        id: 4,
        name: 'strab',
        img: 'assets/svg/strab.svg',
        delay: 1800,
        bottom: isTablet ? 70.h : 10.h,
        left: 20.w,
      ),
      Item(
        id: 5,
        name: 'note',
        img: 'assets/svg/note.svg',
        delay: 1950,
        bottom: isTablet ? 90.h : 10.h,
        right: 20.w,
      ),
      Item(
        id: 6,
        name: 'orange',
        img: 'assets/svg/orange.svg',
        delay: 2100,
        bottom: isTablet ? 70.h : 15.h,
        right: 100.w,
      ),
      Item(
        id: 7,
        name: 'ruler',
        img: 'assets/svg/ruler.svg',
        delay: 2250,
        bottom: isTablet ? 230.h : 100.h,
        left: 80.w,
      ),
      Item(
        id: 8,
        name: 'pencil',
        img: 'assets/svg/pencil.svg',
        delay: 2400,
        bottom: isTablet ? 230.h : 90.h,
        left: 140.w,
      ),
    ];
    itemsShadow = [
      Item(
          id: 9,
          name: 'bag',
          img: 'assets/svg/bag1.svg',
          delay: 150,
          top: isTablet ? 150.h : 70.h,
          left: 20.w),
      Item(
        id: 10,
        name: 'apple',
        img: 'assets/svg/apple1.svg',
        delay: 300,
        top: isTablet ? 100.h : 20.h,
        right: 100.w,
      ),
      Item(
        id: 11,
        name: 'earth',
        img: 'assets/svg/earth1.svg',
        delay: 450,
        top: isTablet ? 150.h : 60.h,
        right: 20.w,
      ),
      Item(
        id: 12,
        name: 'strab',
        img: 'assets/svg/strab1.svg',
        delay: 600,
        bottom: isTablet ? 70.h : 10.h,
        left: 20.w,
      ),
      Item(
        id: 13,
        name: 'note',
        img: 'assets/svg/note1.svg',
        delay: 750,
        bottom: isTablet ? 90.h : 10.h,
        right: 20.w,
      ),
      Item(
        id: 14,
        name: 'orange',
        img: 'assets/svg/orange1.svg',
        delay: 900,
        bottom: isTablet ? 70.h : 15.h,
        right: 100.w,
      ),
      Item(
        id: 15,
        name: 'ruler',
        img: 'assets/svg/ruler1.svg',
        delay: 1050,
        bottom: isTablet ? 230.h : 100.h,
        left: 80.w,
      ),
      Item(
        id: 16,
        name: 'pencil',
        img: 'assets/svg/pencil1.svg',
        delay: 1200,
        bottom: isTablet ? 230.h : 90.h,
        left: 140.w,
      ),
    ];
    emit(PlayAgain());
  }

  onDraggableCanceled() {
    emit(GameOnReject());
  }
}
