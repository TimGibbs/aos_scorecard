import 'package:aos_scorecard/data/models/game_dm.dart';
import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_round.dart';

class GameToGameDM {
  static GameDM toGameDM(Game game) {
    return GameDM(
        id: game.id,
        gameType: game.gameType,
        gameVersion: game.gameVersion,
        created: game.created,
        lastUpdated: game.lastUpdated,
        name: game.name!,
        battlePlan: game.battlePlan,
        attackerName: game.attackerName,
        defenderName: game.defenderName,
        gameResult: game.gameResult,
        attacker1battleTactic: game.attackerRound1.battleTactic,
        attacker1wasBattleTacticCompleted:
            game.attackerRound1.wasBattleTacticCompleted,
        attacker1objectivePoints: game.attackerRound1.objectivePoints,
        attacker1wentFirst: game.attackerRound1.wentFirst,
        attacker2battleTactic: game.attackerRound2.battleTactic,
        attacker2wasBattleTacticCompleted:
            game.attackerRound2.wasBattleTacticCompleted,
        attacker2objectivePoints: game.attackerRound2.objectivePoints,
        attacker2wentFirst: game.attackerRound2.wentFirst,
        attacker3battleTactic: game.attackerRound3.battleTactic,
        attacker3wasBattleTacticCompleted:
            game.attackerRound3.wasBattleTacticCompleted,
        attacker3objectivePoints: game.attackerRound3.objectivePoints,
        attacker3wentFirst: game.attackerRound3.wentFirst,
        attacker4battleTactic: game.attackerRound4.battleTactic,
        attacker4wasBattleTacticCompleted:
            game.attackerRound4.wasBattleTacticCompleted,
        attacker4objectivePoints: game.attackerRound4.objectivePoints,
        attacker4wentFirst: game.attackerRound4.wentFirst,
        attacker5battleTactic: game.attackerRound5.battleTactic,
        attacker5wasBattleTacticCompleted:
            game.attackerRound5.wasBattleTacticCompleted,
        attacker5objectivePoints: game.attackerRound5.objectivePoints,
        attacker5wentFirst: game.attackerRound5.wentFirst,
        defender1battleTactic: game.defenderRound1.battleTactic,
        defender1wasBattleTacticCompleted:
            game.defenderRound1.wasBattleTacticCompleted,
        defender1objectivePoints: game.defenderRound1.objectivePoints,
        defender1wentFirst: game.defenderRound1.wentFirst,
        defender2battleTactic: game.defenderRound2.battleTactic,
        defender2wasBattleTacticCompleted:
            game.defenderRound2.wasBattleTacticCompleted,
        defender2objectivePoints: game.defenderRound2.objectivePoints,
        defender2wentFirst: game.defenderRound2.wentFirst,
        defender3battleTactic: game.defenderRound3.battleTactic,
        defender3wasBattleTacticCompleted:
            game.defenderRound3.wasBattleTacticCompleted,
        defender3objectivePoints: game.defenderRound3.objectivePoints,
        defender3wentFirst: game.defenderRound3.wentFirst,
        defender4battleTactic: game.defenderRound4.battleTactic,
        defender4wasBattleTacticCompleted:
            game.defenderRound4.wasBattleTacticCompleted,
        defender4objectivePoints: game.defenderRound4.objectivePoints,
        defender4wentFirst: game.defenderRound4.wentFirst,
        defender5battleTactic: game.defenderRound5.battleTactic,
        defender5wasBattleTacticCompleted:
            game.defenderRound5.wasBattleTacticCompleted,
        defender5objectivePoints: game.defenderRound5.objectivePoints,
        defender5wentFirst: game.defenderRound5.wentFirst);
  }

  static Game fromGameDM(GameDM gameDM) {
    return Game.existing(
        id: gameDM.id,
        gameType: gameDM.gameType,
        gameVersion: gameDM.gameVersion,
        created: gameDM.created,
        lastUpdated: gameDM.lastUpdated,
        name: gameDM.name,
        battlePlan: gameDM.battlePlan,
        attackerName: gameDM.attackerName,
        defenderName: gameDM.defenderName,
        gameResult: gameDM.gameResult,
        attackerRound1: PlayerRound.existing(
            roundNumber: 1,
            battleTactic: gameDM.attacker1battleTactic,
            wasBattleTacticCompleted: gameDM.attacker1wasBattleTacticCompleted,
            objectivePoints: gameDM.attacker1objectivePoints,
            wentFirst: gameDM.attacker1wentFirst),
        attackerRound2: PlayerRound.existing(
            roundNumber: 2,
            battleTactic: gameDM.attacker2battleTactic,
            wasBattleTacticCompleted: gameDM.attacker2wasBattleTacticCompleted,
            objectivePoints: gameDM.attacker2objectivePoints,
            wentFirst: gameDM.attacker2wentFirst),
        attackerRound3: PlayerRound.existing(
            roundNumber: 3,
            battleTactic: gameDM.attacker3battleTactic,
            wasBattleTacticCompleted: gameDM.attacker3wasBattleTacticCompleted,
            objectivePoints: gameDM.attacker3objectivePoints,
            wentFirst: gameDM.attacker3wentFirst),
        attackerRound4: PlayerRound.existing(
            roundNumber: 4,
            battleTactic: gameDM.attacker4battleTactic,
            wasBattleTacticCompleted: gameDM.attacker4wasBattleTacticCompleted,
            objectivePoints: gameDM.attacker4objectivePoints,
            wentFirst: gameDM.attacker4wentFirst),
        attackerRound5: PlayerRound.existing(
            roundNumber: 5,
            battleTactic: gameDM.attacker5battleTactic,
            wasBattleTacticCompleted: gameDM.attacker5wasBattleTacticCompleted,
            objectivePoints: gameDM.attacker5objectivePoints,
            wentFirst: gameDM.attacker5wentFirst),
        defenderRound1: PlayerRound.existing(
            roundNumber: 1,
            battleTactic: gameDM.defender1battleTactic,
            wasBattleTacticCompleted: gameDM.defender1wasBattleTacticCompleted,
            objectivePoints: gameDM.defender1objectivePoints,
            wentFirst: gameDM.defender1wentFirst),
        defenderRound2: PlayerRound.existing(
            roundNumber: 2,
            battleTactic: gameDM.defender2battleTactic,
            wasBattleTacticCompleted: gameDM.defender2wasBattleTacticCompleted,
            objectivePoints: gameDM.defender2objectivePoints,
            wentFirst: gameDM.defender2wentFirst),
        defenderRound3: PlayerRound.existing(
            roundNumber: 3,
            battleTactic: gameDM.defender3battleTactic,
            wasBattleTacticCompleted: gameDM.defender3wasBattleTacticCompleted,
            objectivePoints: gameDM.defender3objectivePoints,
            wentFirst: gameDM.defender3wentFirst),
        defenderRound4: PlayerRound.existing(
            roundNumber: 4,
            battleTactic: gameDM.defender4battleTactic,
            wasBattleTacticCompleted: gameDM.defender4wasBattleTacticCompleted,
            objectivePoints: gameDM.defender4objectivePoints,
            wentFirst: gameDM.defender4wentFirst),
        defenderRound5: PlayerRound.existing(
            roundNumber: 5,
            battleTactic: gameDM.defender5battleTactic,
            wasBattleTacticCompleted: gameDM.defender5wasBattleTacticCompleted,
            objectivePoints: gameDM.defender5objectivePoints,
            wentFirst: gameDM.defender5wentFirst));
  }
}
