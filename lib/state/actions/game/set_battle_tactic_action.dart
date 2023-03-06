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
    game.attackerRounds[action.round - 1].battleTactic = action.battleTactic;
  } else if (action.playerSide == PlayerSide.defender) {
    game.defenderRounds[action.round - 1].battleTactic = action.battleTactic;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetBattleTacticAction> setBattleTacticReducer =
    TypedReducer<Game, SetBattleTacticAction>(_setBattleTactic);
