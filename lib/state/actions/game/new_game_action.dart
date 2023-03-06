import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class NewGameAction {
  NewGameAction();
  @override
  String toString() {
    return 'NewGameAction { }';
  }
}

Game _newGame(Game game, NewGameAction action) {
  return Game.newGame();
}

TypedReducer<Game, NewGameAction> newGameReducer =
    TypedReducer<Game, NewGameAction>(_newGame);
