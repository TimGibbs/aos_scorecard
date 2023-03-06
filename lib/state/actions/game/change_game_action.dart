import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class ChangeGameAction {
  Game game;
  ChangeGameAction(this.game);
  @override
  String toString() {
    return 'ChangeGameAction{ game: $game}';
  }
}

Game _changeGame(Game game, ChangeGameAction action) {
  return action.game;
}

TypedReducer<Game, ChangeGameAction> changeGameReducer =
    TypedReducer<Game, ChangeGameAction>(_changeGame);
