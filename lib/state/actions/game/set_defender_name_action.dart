import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class SetDefenderNameAction {
  String defenderName;
  SetDefenderNameAction(this.defenderName);
  @override
  String toString() {
    return 'SetDefenderNameAction{ defenderName: $defenderName}';
  }
}

Game _setDefenderName(Game game, SetDefenderNameAction action) {
  game.defenderName = action.defenderName;
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetDefenderNameAction> setDefenderNameReducer =
    TypedReducer<Game, SetDefenderNameAction>(_setDefenderName);
