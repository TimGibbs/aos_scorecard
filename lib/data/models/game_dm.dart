import 'package:aos_scorecard/data/models/game_dm_constants.dart';

class GameDM {
  final String id;
  final String gameType;
  final String gameVersion;
  final DateTime created;
  final DateTime lastUpdated;
  final String name;
  final String? battlePlan;

  final String? attacker1battleTactic;
  final bool attacker1wasBattleTacticCompleted;
  final int attacker1objectivePoints;
  final bool attacker1wentFirst;
  final String? attacker2battleTactic;
  final bool attacker2wasBattleTacticCompleted;
  final int attacker2objectivePoints;
  final bool attacker2wentFirst;
  final String? attacker3battleTactic;
  final bool attacker3wasBattleTacticCompleted;
  final int attacker3objectivePoints;
  final bool attacker3wentFirst;
  final String? attacker4battleTactic;
  final bool attacker4wasBattleTacticCompleted;
  final int attacker4objectivePoints;
  final bool attacker4wentFirst;
  final String? attacker5battleTactic;
  final bool attacker5wasBattleTacticCompleted;
  final int attacker5objectivePoints;
  final bool attacker5wentFirst;
  final String? defender1battleTactic;
  final bool defender1wasBattleTacticCompleted;
  final int defender1objectivePoints;
  final bool defender1wentFirst;
  final String? defender2battleTactic;
  final bool defender2wasBattleTacticCompleted;
  final int defender2objectivePoints;
  final bool defender2wentFirst;
  final String? defender3battleTactic;
  final bool defender3wasBattleTacticCompleted;
  final int defender3objectivePoints;
  final bool defender3wentFirst;
  final String? defender4battleTactic;
  final bool defender4wasBattleTacticCompleted;
  final int defender4objectivePoints;
  final bool defender4wentFirst;
  final String? defender5battleTactic;
  final bool defender5wasBattleTacticCompleted;
  final int defender5objectivePoints;
  final bool defender5wentFirst;

  GameDM(
      {required this.id,
      required this.gameType,
      required this.gameVersion,
      required this.created,
      required this.lastUpdated,
      required this.name,
      required this.battlePlan,
      required this.attacker1battleTactic,
      required this.attacker1wasBattleTacticCompleted,
      required this.attacker1objectivePoints,
      required this.attacker1wentFirst,
      required this.attacker2battleTactic,
      required this.attacker2wasBattleTacticCompleted,
      required this.attacker2objectivePoints,
      required this.attacker2wentFirst,
      required this.attacker3battleTactic,
      required this.attacker3wasBattleTacticCompleted,
      required this.attacker3objectivePoints,
      required this.attacker3wentFirst,
      required this.attacker4battleTactic,
      required this.attacker4wasBattleTacticCompleted,
      required this.attacker4objectivePoints,
      required this.attacker4wentFirst,
      required this.attacker5battleTactic,
      required this.attacker5wasBattleTacticCompleted,
      required this.attacker5objectivePoints,
      required this.attacker5wentFirst,
      required this.defender1battleTactic,
      required this.defender1wasBattleTacticCompleted,
      required this.defender1objectivePoints,
      required this.defender1wentFirst,
      required this.defender2battleTactic,
      required this.defender2wasBattleTacticCompleted,
      required this.defender2objectivePoints,
      required this.defender2wentFirst,
      required this.defender3battleTactic,
      required this.defender3wasBattleTacticCompleted,
      required this.defender3objectivePoints,
      required this.defender3wentFirst,
      required this.defender4battleTactic,
      required this.defender4wasBattleTacticCompleted,
      required this.defender4objectivePoints,
      required this.defender4wentFirst,
      required this.defender5battleTactic,
      required this.defender5wasBattleTacticCompleted,
      required this.defender5objectivePoints,
      required this.defender5wentFirst});

  GameDM.fromMap(Map<String, dynamic> map)
      : this(
          id: map[GameDMConstants.id] as String,
          gameType: map[GameDMConstants.gameType] as String,
          gameVersion: map[GameDMConstants.gameVersion] as String,
          created: DateTime.parse(map[GameDMConstants.created] as String),
          lastUpdated:
              DateTime.parse(map[GameDMConstants.lastUpdated] as String),
          name: map[GameDMConstants.name] as String,
          battlePlan: map[GameDMConstants.battlePlan] as String?,
          attacker1battleTactic:
              map[GameDMConstants.attacker1battleTactic] as String?,
          attacker1wasBattleTacticCompleted:
              (map[GameDMConstants.attacker1wasBattleTacticCompleted] as int) !=
                  0,
          attacker1objectivePoints:
              map[GameDMConstants.attacker1objectivePoints] as int,
          attacker1wentFirst:
              (map[GameDMConstants.attacker1wentFirst] as int) != 0,
          attacker2battleTactic:
              map[GameDMConstants.attacker2battleTactic] as String?,
          attacker2wasBattleTacticCompleted:
              (map[GameDMConstants.attacker2wasBattleTacticCompleted] as int) !=
                  0,
          attacker2objectivePoints:
              map[GameDMConstants.attacker2objectivePoints] as int,
          attacker2wentFirst:
              (map[GameDMConstants.attacker2wentFirst] as int) != 0,
          attacker3battleTactic:
              map[GameDMConstants.attacker3battleTactic] as String?,
          attacker3wasBattleTacticCompleted:
              (map[GameDMConstants.attacker3wasBattleTacticCompleted] as int) !=
                  0,
          attacker3objectivePoints:
              map[GameDMConstants.attacker3objectivePoints] as int,
          attacker3wentFirst:
              (map[GameDMConstants.attacker3wentFirst] as int) != 0,
          attacker4battleTactic:
              map[GameDMConstants.attacker4battleTactic] as String?,
          attacker4wasBattleTacticCompleted:
              (map[GameDMConstants.attacker4wasBattleTacticCompleted] as int) !=
                  0,
          attacker4objectivePoints:
              map[GameDMConstants.attacker4objectivePoints] as int,
          attacker4wentFirst:
              (map[GameDMConstants.attacker4wentFirst] as int) != 0,
          attacker5battleTactic:
              map[GameDMConstants.attacker5battleTactic] as String?,
          attacker5wasBattleTacticCompleted:
              (map[GameDMConstants.attacker5wasBattleTacticCompleted] as int) !=
                  0,
          attacker5objectivePoints:
              map[GameDMConstants.attacker5objectivePoints] as int,
          attacker5wentFirst:
              (map[GameDMConstants.attacker5wentFirst] as int) != 0,
          defender1battleTactic:
              map[GameDMConstants.defender1battleTactic] as String?,
          defender1wasBattleTacticCompleted:
              (map[GameDMConstants.defender1wasBattleTacticCompleted] as int) !=
                  0,
          defender1objectivePoints:
              map[GameDMConstants.defender1objectivePoints] as int,
          defender1wentFirst:
              (map[GameDMConstants.defender1wentFirst] as int) != 0,
          defender2battleTactic:
              map[GameDMConstants.defender2battleTactic] as String?,
          defender2wasBattleTacticCompleted:
              (map[GameDMConstants.defender2wasBattleTacticCompleted] as int) !=
                  0,
          defender2objectivePoints:
              map[GameDMConstants.defender2objectivePoints] as int,
          defender2wentFirst:
              (map[GameDMConstants.defender2wentFirst] as int) != 0,
          defender3battleTactic:
              map[GameDMConstants.defender3battleTactic] as String?,
          defender3wasBattleTacticCompleted:
              (map[GameDMConstants.defender3wasBattleTacticCompleted] as int) !=
                  0,
          defender3objectivePoints:
              map[GameDMConstants.defender3objectivePoints] as int,
          defender3wentFirst:
              (map[GameDMConstants.defender3wentFirst] as int) != 0,
          defender4battleTactic:
              map[GameDMConstants.defender4battleTactic] as String?,
          defender4wasBattleTacticCompleted:
              (map[GameDMConstants.defender4wasBattleTacticCompleted] as int) !=
                  0,
          defender4objectivePoints:
              map[GameDMConstants.defender4objectivePoints] as int,
          defender4wentFirst:
              (map[GameDMConstants.defender4wentFirst] as int) != 0,
          defender5battleTactic:
              map[GameDMConstants.defender5battleTactic] as String?,
          defender5wasBattleTacticCompleted:
              (map[GameDMConstants.defender5wasBattleTacticCompleted] as int) !=
                  0,
          defender5objectivePoints:
              map[GameDMConstants.defender5objectivePoints] as int,
          defender5wentFirst:
              (map[GameDMConstants.defender5wentFirst] as int) != 0,
        );

  Map<String, dynamic> toMap() {
    return {
      GameDMConstants.id: id,
      GameDMConstants.gameType: gameType,
      GameDMConstants.gameVersion: gameVersion,
      GameDMConstants.created: created.toIso8601String(),
      GameDMConstants.lastUpdated: lastUpdated.toIso8601String(),
      GameDMConstants.name: name,
      GameDMConstants.battlePlan: battlePlan,
      GameDMConstants.attacker1battleTactic: attacker1battleTactic,
      GameDMConstants.attacker1wasBattleTacticCompleted:
          attacker1wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.attacker1objectivePoints: attacker1objectivePoints,
      GameDMConstants.attacker1wentFirst: attacker1wentFirst ? 1 : 0,
      GameDMConstants.attacker2battleTactic: attacker2battleTactic,
      GameDMConstants.attacker2wasBattleTacticCompleted:
          attacker2wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.attacker2objectivePoints: attacker2objectivePoints,
      GameDMConstants.attacker2wentFirst: attacker2wentFirst ? 1 : 0,
      GameDMConstants.attacker3battleTactic: attacker3battleTactic,
      GameDMConstants.attacker3wasBattleTacticCompleted:
          attacker3wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.attacker3objectivePoints: attacker3objectivePoints,
      GameDMConstants.attacker3wentFirst: attacker3wentFirst ? 1 : 0,
      GameDMConstants.attacker4battleTactic: attacker4battleTactic,
      GameDMConstants.attacker4wasBattleTacticCompleted:
          attacker4wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.attacker4objectivePoints: attacker4objectivePoints,
      GameDMConstants.attacker4wentFirst: attacker4wentFirst ? 1 : 0,
      GameDMConstants.attacker5battleTactic: attacker5battleTactic,
      GameDMConstants.attacker5wasBattleTacticCompleted:
          attacker5wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.attacker5objectivePoints: attacker5objectivePoints,
      GameDMConstants.attacker5wentFirst: attacker5wentFirst ? 1 : 0,
      GameDMConstants.defender1battleTactic: defender1battleTactic,
      GameDMConstants.defender1wasBattleTacticCompleted:
          defender1wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.defender1objectivePoints: defender1objectivePoints,
      GameDMConstants.defender1wentFirst: defender1wentFirst ? 1 : 0,
      GameDMConstants.defender2battleTactic: defender2battleTactic,
      GameDMConstants.defender2wasBattleTacticCompleted:
          defender2wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.defender2objectivePoints: defender2objectivePoints,
      GameDMConstants.defender2wentFirst: defender2wentFirst ? 1 : 0,
      GameDMConstants.defender3battleTactic: defender3battleTactic,
      GameDMConstants.defender3wasBattleTacticCompleted:
          defender3wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.defender3objectivePoints: defender3objectivePoints,
      GameDMConstants.defender3wentFirst: defender3wentFirst ? 1 : 0,
      GameDMConstants.defender4battleTactic: defender4battleTactic,
      GameDMConstants.defender4wasBattleTacticCompleted:
          defender4wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.defender4objectivePoints: defender4objectivePoints,
      GameDMConstants.defender4wentFirst: defender4wentFirst ? 1 : 0,
      GameDMConstants.defender5battleTactic: defender5battleTactic,
      GameDMConstants.defender5wasBattleTacticCompleted:
          defender5wasBattleTacticCompleted ? 1 : 0,
      GameDMConstants.defender5objectivePoints: defender5objectivePoints,
      GameDMConstants.defender5wentFirst: defender5wentFirst ? 1 : 0,
    };
  }
}
