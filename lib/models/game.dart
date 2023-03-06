import 'dart:convert';
import 'package:aos_scorecard/models/player_round.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_guid/flutter_guid.dart';

class Game {
  late final String id;
  late final String gameType;
  late final String gameVersion;
  late final DateTime created;
  late DateTime lastUpdated;
  String? name;
  String? battlePlan;
  late final List<PlayerRound> attackerRounds;
  late final List<PlayerRound> defenderRounds;

  Game.newGame() {
    id = Guid.newGuid.toString();
    created = DateTime.now().toUtc();
    lastUpdated = created;
    attackerRounds = defaultPlayerRounds(true);
    defenderRounds = defaultPlayerRounds(false);
    gameType = 'AOS';
    gameVersion = '3.3';
  }

  Game.existing({
    required this.id,
    required this.gameType,
    required this.gameVersion,
    required this.created,
    required this.lastUpdated,
    required this.name,
    required this.battlePlan,
    required this.attackerRounds,
    required this.defenderRounds,
  });

  List<PlayerRound> defaultPlayerRounds(bool isGoingFirst) {
    var rounds = <PlayerRound>[];
    for (var i = 1; i < 6; i++) {
      rounds.add(PlayerRound(roundNumber: i, wentFirst: isGoingFirst));
    }
    return rounds;
  }

  int attackerPoints() =>
      attackerRounds.fold(0, (prev, n) => prev + n.roundPoints());

  int defenderPoints() =>
      defenderRounds.fold(0, (prev, n) => prev + n.roundPoints());

  void setUpdated() {
    lastUpdated = DateTime.now().toUtc();
    var s = toJson();
    debugPrint('game: $s');
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    throw Exception("not implemented");
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'gameType': gameType,
        'gameVersion': gameVersion,
        'created': created.toIso8601String(),
        'lastUpdated': lastUpdated.toIso8601String(),
        'name': name,
        'battlePlan': battlePlan,
        'attackerRounds': jsonEncode(attackerRounds),
        'defenderRounds': jsonEncode(defenderRounds),
      };
}
