import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:redux/redux.dart';

class SetBattleTacticAction {
  int round;
  PlayerSide playerSide;
  String battleTactic;
  SetBattleTacticAction(
      {required this.round,
      required this.playerSide,
      required this.battleTactic});
  @override
  String toString() {
    return 'SetBattleTacticAction{ round: $round, playerSide: $playerSide, battleTactic: $battleTactic}';
  }
}

Game _setBattleTactic(Game game, SetBattleTacticAction action) {
  if (action.round > 5 || action.round < 1) {
    throw Exception("round must be between 1 and 5 inclusive");
  }
  if (action.playerSide == PlayerSide.attacker) {
    switch (action.round) {
      case 1:
        game.attackerRound1.battleTactic = action.battleTactic;
        break;
      case 2:
        game.attackerRound2.battleTactic = action.battleTactic;
        break;
      case 3:
        game.attackerRound3.battleTactic = action.battleTactic;
        break;
      case 4:
        game.attackerRound4.battleTactic = action.battleTactic;
        break;
      case 5:
        game.attackerRound5.battleTactic = action.battleTactic;
        break;
    }
  } else if (action.playerSide == PlayerSide.defender) {
    switch (action.round) {
      case 1:
        game.defenderRound1.battleTactic = action.battleTactic;
        break;
      case 2:
        game.defenderRound2.battleTactic = action.battleTactic;
        break;
      case 3:
        game.defenderRound3.battleTactic = action.battleTactic;
        break;
      case 4:
        game.defenderRound4.battleTactic = action.battleTactic;
        break;
      case 5:
        game.defenderRound5.battleTactic = action.battleTactic;
        break;
    }
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetBattleTacticAction> setBattleTacticReducer =
    TypedReducer<Game, SetBattleTacticAction>(_setBattleTactic);
