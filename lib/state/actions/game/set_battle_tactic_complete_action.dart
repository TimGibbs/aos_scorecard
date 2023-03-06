import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:redux/redux.dart';

class SetBattleTacticCompleteAction {
  int round;
  PlayerSide playerSide;
  bool battleTacticComplete;
  SetBattleTacticCompleteAction(
      {required this.round,
      required this.playerSide,
      required this.battleTacticComplete});
  @override
  String toString() {
    return 'SetBattleTacticCompleteAction{ round: $round, playerSide: $playerSide, battleTacticComplete: $battleTacticComplete}';
  }
}

Game _setBattleTacticComplete(Game game, SetBattleTacticCompleteAction action) {
  if (action.round > 5 || action.round < 1) {
    throw Exception("round must be between 1 and 5 inclusive");
  }
  if (action.playerSide == PlayerSide.attacker) {
    game.attackerRounds[action.round - 1].wasBattleTacticCompleted =
        action.battleTacticComplete;
  } else if (action.playerSide == PlayerSide.defender) {
    game.defenderRounds[action.round - 1].wasBattleTacticCompleted =
        action.battleTacticComplete;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetBattleTacticCompleteAction>
    setBattleTacticCompleteReducer =
    TypedReducer<Game, SetBattleTacticCompleteAction>(_setBattleTacticComplete);
