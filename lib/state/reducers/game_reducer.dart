import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/state/actions/game/name_game_action.dart';
import 'package:aos_scorecard/state/actions/game/new_game_action.dart';
import 'package:aos_scorecard/state/actions/game/change_game_action.dart';
import 'package:aos_scorecard/state/actions/game/set_attacker_name.dart';
import 'package:aos_scorecard/state/actions/game/set_battle_tactic_action.dart';
import 'package:aos_scorecard/state/actions/game/set_battle_tactic_complete_action.dart';
import 'package:aos_scorecard/state/actions/game/set_battleplan_action.dart';
import 'package:aos_scorecard/state/actions/game/set_defender_name_action.dart';
import 'package:aos_scorecard/state/actions/game/set_game_result_action.dart';
import 'package:aos_scorecard/state/actions/game/set_objective_points_action.dart';
import 'package:aos_scorecard/state/actions/game/switch_first_player_action.dart';
import 'package:redux/redux.dart';

final gameReducer = combineReducers<Game>([
  newGameReducer,
  changeGameReducer,
  setBattlePlanReducer,
  setBattleTacticReducer,
  setBattleTacticCompleteReducer,
  setObjectivePoints,
  switchFirstPlayer,
  nameGameReducer,
  setAttackerNameReducer,
  setDefenderNameReducer,
  setGameResultReducer
]);
