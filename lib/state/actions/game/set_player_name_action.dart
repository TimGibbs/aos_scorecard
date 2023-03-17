
import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:redux/redux.dart';

class SetPlayerNameAction {
  String playerName;
  PlayerSide playerSide;
  SetPlayerNameAction(this.playerName, this.playerSide);
  @override
  String toString() {
    return 'SetPlayerNameAction{ playerName: $playerName}';
  }
}

Game _setPlayerName(Game game, SetPlayerNameAction action) {
  switch (action.playerSide) {
    case PlayerSide.attacker:
      game.attackerName = action.playerName;

      break;
    case PlayerSide.defender:
      game.defenderName = action.playerName;

      break;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetPlayerNameAction> setPlayerNameReducer =
    TypedReducer<Game, SetPlayerNameAction>(_setPlayerName);
