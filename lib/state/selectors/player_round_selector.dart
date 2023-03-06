import 'package:aos_scorecard/models/player_round.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:redux/redux.dart';

PlayerRound playerRoundSelector(
    Store<AppState> store, PlayerSide playerSide, int round) {
  if (round > 5 || round < 1) {
    throw Exception("round must be between 1 and 5 inclusive");
  }

  if (playerSide == PlayerSide.attacker) {
    return store.state.game.attackerRounds[round - 1];
  }
  if (playerSide == PlayerSide.defender) {
    return store.state.game.defenderRounds[round - 1];
  }
  throw Exception("fallen through player sides");
}
