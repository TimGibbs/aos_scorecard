import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:redux/redux.dart';

class SetObjectivePointsAction {
  int round;
  PlayerSide playerSide;
  int objectivePoints;
  SetObjectivePointsAction(
      {required this.round,
      required this.playerSide,
      required this.objectivePoints});
  @override
  String toString() {
    return 'SetObjectivePointsAction{ round: $round, playerSide: $playerSide, objectivePoints: $objectivePoints}';
  }
}

Game _setObjectivePoints(Game game, SetObjectivePointsAction action) {
  if (action.round > 5 || action.round < 1) {
    throw Exception("round must be between 1 and 5 inclusive");
  }
  if (action.playerSide == PlayerSide.attacker) {
    game.attackerRounds[action.round - 1].objectivePoints =
        action.objectivePoints;
  } else if (action.playerSide == PlayerSide.defender) {
    game.defenderRounds[action.round - 1].objectivePoints =
        action.objectivePoints;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetObjectivePointsAction> setObjectivePoints =
    TypedReducer<Game, SetObjectivePointsAction>(_setObjectivePoints);
