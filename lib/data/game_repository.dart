import 'package:aos_scorecard/data/database_service.dart';
import 'package:aos_scorecard/data/models/dame_details.dart';
import 'package:aos_scorecard/data/models/game_dm.dart';
import 'package:aos_scorecard/mappers/game_to_game_dm.dart';
import 'package:aos_scorecard/models/game.dart';
import 'package:sqflite/sqflite.dart';
import 'package:aos_scorecard/data/models/game_dm_constants.dart';

class GameRepository {
  static const String tableName = 'game';

  static const String createTable = 'CREATE TABLE $tableName('
      '${GameDMConstants.id} TEXT PRIMARY KEY, '
      '${GameDMConstants.gameType} TEXT, '
      '${GameDMConstants.gameVersion} TEXT, '
      '${GameDMConstants.created} TEXT, '
      '${GameDMConstants.lastUpdated} TEXT, '
      '${GameDMConstants.name} TEXT, '
      '${GameDMConstants.battlePlan} TEXT, '
      '${GameDMConstants.attacker1battleTactic} TEXT, '
      '${GameDMConstants.attacker1wasBattleTacticCompleted} INT, '
      '${GameDMConstants.attacker1objectivePoints} INT, '
      '${GameDMConstants.attacker1wentFirst} INT, '
      '${GameDMConstants.attacker2battleTactic} TEXT, '
      '${GameDMConstants.attacker2wasBattleTacticCompleted} INT, '
      '${GameDMConstants.attacker2objectivePoints} INT, '
      '${GameDMConstants.attacker2wentFirst} INT, '
      '${GameDMConstants.attacker3battleTactic} TEXT, '
      '${GameDMConstants.attacker3wasBattleTacticCompleted} INT, '
      '${GameDMConstants.attacker3objectivePoints} INT, '
      '${GameDMConstants.attacker3wentFirst} INT, '
      '${GameDMConstants.attacker4battleTactic} TEXT, '
      '${GameDMConstants.attacker4wasBattleTacticCompleted} INT, '
      '${GameDMConstants.attacker4objectivePoints} INT, '
      '${GameDMConstants.attacker4wentFirst} INT, '
      '${GameDMConstants.attacker5battleTactic} TEXT, '
      '${GameDMConstants.attacker5wasBattleTacticCompleted} INT, '
      '${GameDMConstants.attacker5objectivePoints} INT, '
      '${GameDMConstants.attacker5wentFirst} INT, '
      '${GameDMConstants.defender1battleTactic} TEXT, '
      '${GameDMConstants.defender1wasBattleTacticCompleted} INT, '
      '${GameDMConstants.defender1objectivePoints} INT, '
      '${GameDMConstants.defender1wentFirst} INT, '
      '${GameDMConstants.defender2battleTactic} TEXT, '
      '${GameDMConstants.defender2wasBattleTacticCompleted} INT, '
      '${GameDMConstants.defender2objectivePoints} INT, '
      '${GameDMConstants.defender2wentFirst} INT, '
      '${GameDMConstants.defender3battleTactic} TEXT, '
      '${GameDMConstants.defender3wasBattleTacticCompleted} INT, '
      '${GameDMConstants.defender3objectivePoints} INT, '
      '${GameDMConstants.defender3wentFirst} INT, '
      '${GameDMConstants.defender4battleTactic} TEXT, '
      '${GameDMConstants.defender4wasBattleTacticCompleted} INT, '
      '${GameDMConstants.defender4objectivePoints} INT, '
      '${GameDMConstants.defender4wentFirst} INT, '
      '${GameDMConstants.defender5battleTactic} TEXT, '
      '${GameDMConstants.defender5wasBattleTacticCompleted} INT, '
      '${GameDMConstants.defender5objectivePoints} INT, '
      '${GameDMConstants.defender5wentFirst} INT)';

  Future<void> addOrUpdate(Game game) async {
    var h = await loadGame(game.id);
    if (h != null) {
      await updateGame(game);
    } else {
      await insertGame(game);
    }
  }

  Future<void> insertGame(Game game) async {
    final Database db = await DatabaseService.getDb();
    final dm = GameToGameDM.toGameDM(game);
    await db.insert(tableName, dm.toMap());
  }

  Future<void> updateGame(Game game) async {
    final Database db = await DatabaseService.getDb();
    final dm = GameToGameDM.toGameDM(game);
    await db.update(tableName, dm.toMap(),
        where: '${GameDMConstants.id} = \'${game.id}\'');
  }

  Future<List<Game>> games() async {
    final Database db = await DatabaseService.getDb();
    final List<Map<String, dynamic>> gameMaps = await db.query(tableName);
    return List.generate(gameMaps.length,
        (index) => GameToGameDM.fromGameDM(GameDM.fromMap(gameMaps[index])));
  }

  Future<List<GameDetails>> gamesDetails() async {
    List<String> columnsToSelect = [
      GameDMConstants.id,
      GameDMConstants.created,
      GameDMConstants.lastUpdated,
      GameDMConstants.name,
    ];

    final Database db = await DatabaseService.getDb();
    final List<Map<String, dynamic>> gameMaps =
        await db.query(tableName, columns: columnsToSelect);
    return List.generate(
        gameMaps.length, (index) => GameDetails.fromMap(gameMaps[index]));
  }

  Future<Game?> loadGame(String id) async {
    final Database db = await DatabaseService.getDb();
    final List<Map<String, dynamic>> gameMaps =
        await db.query(tableName, where: '${GameDMConstants.id} = \'$id\'');

    if (gameMaps.isEmpty) return null;
    return GameToGameDM.fromGameDM(GameDM.fromMap(gameMaps[0]));
  }
}
