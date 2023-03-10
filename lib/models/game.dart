import 'package:aos_scorecard/models/player_round.dart';
import 'package:flutter_guid/flutter_guid.dart';

class Game {
  late final String id;
  late final String gameType;
  late final String gameVersion;
  late final DateTime created;
  late DateTime lastUpdated;
  String? name;
  String? battlePlan;
  late final PlayerRound attackerRound1;
  late final PlayerRound attackerRound2;
  late final PlayerRound attackerRound3;
  late final PlayerRound attackerRound4;
  late final PlayerRound attackerRound5;
  late final PlayerRound defenderRound1;
  late final PlayerRound defenderRound2;
  late final PlayerRound defenderRound3;
  late final PlayerRound defenderRound4;
  late final PlayerRound defenderRound5;

  Game.newGame() {
    id = Guid.newGuid.toString();
    created = DateTime.now().toUtc();
    lastUpdated = created;
    gameType = 'AOS';
    gameVersion = '3.3';
    attackerRound1 = PlayerRound(roundNumber: 1, wentFirst: true);
    attackerRound2 = PlayerRound(roundNumber: 2, wentFirst: true);
    attackerRound3 = PlayerRound(roundNumber: 3, wentFirst: true);
    attackerRound4 = PlayerRound(roundNumber: 4, wentFirst: true);
    attackerRound5 = PlayerRound(roundNumber: 5, wentFirst: true);

    defenderRound1 = PlayerRound(roundNumber: 1, wentFirst: false);
    defenderRound2 = PlayerRound(roundNumber: 2, wentFirst: false);
    defenderRound3 = PlayerRound(roundNumber: 3, wentFirst: false);
    defenderRound4 = PlayerRound(roundNumber: 4, wentFirst: false);
    defenderRound5 = PlayerRound(roundNumber: 5, wentFirst: false);
  }
  Game.existing({
    required this.id,
    required this.gameType,
    required this.gameVersion,
    required this.created,
    required this.lastUpdated,
    required this.name,
    required this.battlePlan,
    required this.attackerRound1,
    required this.attackerRound2,
    required this.attackerRound3,
    required this.attackerRound4,
    required this.attackerRound5,
    required this.defenderRound1,
    required this.defenderRound2,
    required this.defenderRound3,
    required this.defenderRound4,
    required this.defenderRound5,
  });

  int attackerPoints() =>
      attackerRound1.roundPoints() +
      attackerRound2.roundPoints() +
      attackerRound3.roundPoints() +
      attackerRound4.roundPoints() +
      attackerRound5.roundPoints();

  int defenderPoints() =>
      defenderRound1.roundPoints() +
      defenderRound2.roundPoints() +
      defenderRound3.roundPoints() +
      defenderRound4.roundPoints() +
      defenderRound5.roundPoints();
  void setUpdated() {
    lastUpdated = DateTime.now().toUtc();
  }
}
