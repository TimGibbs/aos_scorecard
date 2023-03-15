import 'package:aos_scorecard/data/game_repository.dart';
import 'package:aos_scorecard/data/models/game_dm_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Future<Database> getDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'aos_scorecard.db');

    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: 2,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    db.execute(GameRepository.createTable);
  }

  static Future<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      // you can execute drop table and create table
      db.execute(
          'ALTER TABLE ${GameRepository.tableName} ADD COLUMN ${GameDMConstants.attackerName} TEXT;');
      db.execute(
          'ALTER TABLE ${GameRepository.tableName} ADD COLUMN ${GameDMConstants.defenderName} TEXT;');
      db.execute(
          'ALTER TABLE ${GameRepository.tableName} ADD COLUMN ${GameDMConstants.gameResult} TEXT;');
    }
  }
}
