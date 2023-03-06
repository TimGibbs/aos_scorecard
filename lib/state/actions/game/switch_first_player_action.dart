import 'package:aos_scorecard/models/game.dart';
import 'package:redux/redux.dart';

class SwitchFirstPlayerAction {
  int fromRound;
  SwitchFirstPlayerAction({required this.fromRound});
  @override
  String toString() {
    return 'SwitchFirstPlayerAction{ fromRound: $fromRound}';
  }
}

Game _switchFirstPlayer(Game game, SwitchFirstPlayerAction action) {
  final roundNumber = action.fromRound;
  if (roundNumber > 5 || roundNumber < 1) {
    throw Exception("roundNumber must be between 1 and 5 inclusive");
  }
  for (var i = roundNumber; i < 6; i++) {
    game.attackerRounds[i - 1].wentFirst =
        !game.attackerRounds[i - 1].wentFirst;
    game.defenderRounds[i - 1].wentFirst =
        !game.defenderRounds[i - 1].wentFirst;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SwitchFirstPlayerAction> switchFirstPlayer =
    TypedReducer<Game, SwitchFirstPlayerAction>(_switchFirstPlayer);
