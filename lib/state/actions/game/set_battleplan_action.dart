import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class SetBattlePlanAction {
  String battlePlan;
  SetBattlePlanAction(this.battlePlan);
  @override
  String toString() {
    return 'SetBattlePlanAction{ battlePlan: $battlePlan}';
  }
}

Game _setBattlePlan(Game game, SetBattlePlanAction action) {
  game.battlePlan = action.battlePlan;
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetBattlePlanAction> setBattlePlanReducer =
    TypedReducer<Game, SetBattlePlanAction>(_setBattlePlan);
