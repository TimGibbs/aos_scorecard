import 'package:aos_scorecard/models/app_state.dart';
import 'package:aos_scorecard/state/reducers/game_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    game: gameReducer(state.game, action),
  );
}
