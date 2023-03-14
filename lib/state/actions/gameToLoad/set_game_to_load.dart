import 'package:redux/redux.dart';

class SetGameToLoadAction {
  String gameId;
  SetGameToLoadAction(this.gameId);
  @override
  String toString() {
    return 'SetGameToLoadAction{ gameId: $gameId}';
  }
}

String _setGameToLoad(String gameId, SetGameToLoadAction action) {
  return action.gameId;
}

TypedReducer<String, SetGameToLoadAction> setGameToLoadReducer =
    TypedReducer<String, SetGameToLoadAction>(_setGameToLoad);
