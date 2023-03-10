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
  if (roundNumber <= 1) {
    game.attackerRound1.wentFirst = !game.attackerRound1.wentFirst;
    game.defenderRound1.wentFirst = !game.defenderRound1.wentFirst;
  }
  if (roundNumber <= 2) {
    game.attackerRound2.wentFirst = !game.attackerRound2.wentFirst;
    game.defenderRound2.wentFirst = !game.defenderRound2.wentFirst;
  }
  if (roundNumber <= 3) {
    game.attackerRound3.wentFirst = !game.attackerRound3.wentFirst;
    game.defenderRound3.wentFirst = !game.defenderRound3.wentFirst;
  }
  if (roundNumber <= 4) {
    game.attackerRound4.wentFirst = !game.attackerRound4.wentFirst;
    game.defenderRound4.wentFirst = !game.defenderRound4.wentFirst;
  }
  if (roundNumber <= 5) {
    game.attackerRound5.wentFirst = !game.attackerRound5.wentFirst;
    game.defenderRound5.wentFirst = !game.defenderRound5.wentFirst;
  }
  game.setUpdated();
  return game;
}

TypedReducer<Game, SwitchFirstPlayerAction> switchFirstPlayer =
    TypedReducer<Game, SwitchFirstPlayerAction>(_switchFirstPlayer);
