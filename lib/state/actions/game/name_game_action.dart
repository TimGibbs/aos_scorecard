import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class NameGameAction {
  String name;
  NameGameAction(this.name);
  @override
  String toString() {
    return 'NameGameAction{ name: $name}';
  }
}

Game _nameGame(Game game, NameGameAction action) {
  game.name = action.name;
  game.setUpdated();
  return game;
}

TypedReducer<Game, NameGameAction> nameGameReducer =
    TypedReducer<Game, NameGameAction>(_nameGame);
