import 'package:aos_scorecard/data/models/game_dm_constants.dart';

class GameDetailsDM {
  final String id;
  final DateTime created;
  final DateTime lastUpdated;
  final String name;

  GameDetailsDM(this.id, this.created, this.lastUpdated, this.name);

  GameDetailsDM.fromMap(Map<String, dynamic> map)
      : this(
            map[GameDMConstants.id] as String,
            DateTime.parse(map[GameDMConstants.created] as String),
            DateTime.parse(map[GameDMConstants.lastUpdated] as String),
            map[GameDMConstants.name] as String);
}
