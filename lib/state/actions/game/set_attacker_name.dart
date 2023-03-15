import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class SetAttackerNameAction {
  String attackerName;
  SetAttackerNameAction(this.attackerName);
  @override
  String toString() {
    return 'SetAttackerNameAction{ attackerName: $attackerName}';
  }
}

Game _setAttackerName(Game game, SetAttackerNameAction action) {
  game.attackerName = action.attackerName;
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetAttackerNameAction> setAttackerNameReducer =
    TypedReducer<Game, SetAttackerNameAction>(_setAttackerName);
