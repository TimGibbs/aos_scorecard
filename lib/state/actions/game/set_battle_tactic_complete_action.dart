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
    switch (action.round) {
      case 1:
        game.attackerRound1.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 2:
        game.attackerRound2.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 3:
        game.attackerRound3.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 4:
        game.attackerRound4.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 5:
        game.attackerRound5.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
    }
  } else if (action.playerSide == PlayerSide.defender) {
    switch (action.round) {
      case 1:
        game.defenderRound1.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 2:
        game.defenderRound2.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 3:
        game.defenderRound3.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 4:
        game.defenderRound4.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
      case 5:
        game.defenderRound5.wasBattleTacticCompleted =
            action.battleTacticComplete;
        break;
    }
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetBattleTacticCompleteAction>
    setBattleTacticCompleteReducer =
    TypedReducer<Game, SetBattleTacticCompleteAction>(_setBattleTacticComplete);
