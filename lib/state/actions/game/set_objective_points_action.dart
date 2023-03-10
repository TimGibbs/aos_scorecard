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
    switch (action.round) {
      case 1:
        game.attackerRound1.objectivePoints = action.objectivePoints;
        break;
      case 2:
        game.attackerRound2.objectivePoints = action.objectivePoints;
        break;
      case 3:
        game.attackerRound3.objectivePoints = action.objectivePoints;
        break;
      case 4:
        game.attackerRound4.objectivePoints = action.objectivePoints;
        break;
      case 5:
        game.attackerRound5.objectivePoints = action.objectivePoints;
        break;
    }
  } else if (action.playerSide == PlayerSide.defender) {
    switch (action.round) {
      case 1:
        game.defenderRound1.objectivePoints = action.objectivePoints;
        break;
      case 2:
        game.defenderRound2.objectivePoints = action.objectivePoints;
        break;
      case 3:
        game.defenderRound3.objectivePoints = action.objectivePoints;
        break;
      case 4:
        game.defenderRound4.objectivePoints = action.objectivePoints;
        break;
      case 5:
        game.defenderRound5.objectivePoints = action.objectivePoints;
        break;
    }
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetObjectivePointsAction> setObjectivePoints =
    TypedReducer<Game, SetObjectivePointsAction>(_setObjectivePoints);
