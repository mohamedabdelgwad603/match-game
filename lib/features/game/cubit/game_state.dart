part of 'game_cubit.dart';

@immutable
abstract class GameState {}

final class GameInitial extends GameState {}

final class InitGame extends GameState {}

final class GameIsPlaying extends GameState {}
final class ToggleDragState extends GameState {}

final class GameOnAccept extends GameState {}

final class GameOnReject extends GameState {}

final class PlayAgain extends GameState {}

final class IsHelpChanged extends GameState {}
