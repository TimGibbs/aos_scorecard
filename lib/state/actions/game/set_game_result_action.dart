import 'package:aos_scorecard/data/models/game_result.dart';
import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class SetGameResultAction {
  GameResult gameResult;
  SetGameResultAction(this.gameResult);
  @override
  String toString() {
    return 'SetGameResultAction `{ gameResult: $gameResult}';
  }
}

Game _setGameResult(Game game, SetGameResultAction action) {
  game.gameResult = action.gameResult;
  game.setUpdated();
  return game;
}

TypedReducer<Game, SetGameResultAction> setGameResultReducer =
    TypedReducer<Game, SetGameResultAction>(_setGameResult);
