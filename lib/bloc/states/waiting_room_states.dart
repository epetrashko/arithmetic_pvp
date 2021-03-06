import 'package:arithmetic_pvp/data/models/player.dart';

abstract class WaitingRoomState {}

class WaitingRoomStateInitial extends WaitingRoomState {}

class WaitingRoomStateUsersUpdate extends WaitingRoomState {
  List<Player> players;

  WaitingRoomStateUsersUpdate(this.players);
}

class WaitingRoomStateError extends WaitingRoomState {}

class WaitingRoomStateStartGame extends WaitingRoomState {}

class WaitingRoomStateStartGameError extends WaitingRoomState {
  String error;

  WaitingRoomStateStartGameError(this.error);
}

class WaitingRoomStateTimerUpdated extends WaitingRoomState {
  final int timeLeft;

  WaitingRoomStateTimerUpdated(this.timeLeft);
}
