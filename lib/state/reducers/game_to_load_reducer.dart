import 'package:aos_scorecard/state/actions/gameToLoad/set_game_to_load.dart';
import 'package:redux/redux.dart';

final gameToLoadReducer = combineReducers<String>([setGameToLoadReducer]);
