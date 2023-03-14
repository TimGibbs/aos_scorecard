import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/state/reducers/game_reducer.dart';
import 'package:aos_scorecard/state/reducers/game_to_load_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      game: gameReducer(state.game, action),
      gameToLoad: gameToLoadReducer(state.gameToLoad, action));
}
