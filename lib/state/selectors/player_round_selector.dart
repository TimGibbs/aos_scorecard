import 'package:aos_scorecard/models/player_round.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:redux/redux.dart';

PlayerRound playerRoundSelector(
    Store<AppState> store, PlayerSide playerSide, int round) {
  if (round > 5 || round < 1) {
    throw Exception("round must be between 1 and 5 inclusive");
  }

  if (playerSide == PlayerSide.attacker) {
    switch (round) {
      case 1:
        return store.state.game.attackerRound1;
      case 2:
        return store.state.game.attackerRound2;
      case 3:
        return store.state.game.attackerRound3;
      case 4:
        return store.state.game.attackerRound4;
      case 5:
        return store.state.game.attackerRound5;
    }
  }
  if (playerSide == PlayerSide.defender) {
    switch (round) {
      case 1:
        return store.state.game.defenderRound1;
      case 2:
        return store.state.game.defenderRound2;
      case 3:
        return store.state.game.defenderRound3;
      case 4:
        return store.state.game.defenderRound4;
      case 5:
        return store.state.game.defenderRound5;
    }
  }
  throw Exception("fallen through player sides");
}
