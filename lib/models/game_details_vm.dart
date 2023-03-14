import 'package:aos_scorecard/data/models/game_details_DM.dart';
import 'package:aos_scorecard/extensions/pretty_format.dart';

class GameDetailsVM {
  final String id;
  final DateTime created;
  final DateTime lastUpdated;
  final String name;
  late bool isSelected;
  String get title => '$name (${created.prettyFormat()})';

  GameDetailsVM(
      {required this.id,
      required this.created,
      required this.lastUpdated,
      required this.name});

  GameDetailsVM.fromDM(GameDetailsDM gameDetailsDM)
      : this(
            id: gameDetailsDM.id,
            created: gameDetailsDM.created,
            lastUpdated: gameDetailsDM.lastUpdated,
            name: gameDetailsDM.name);
}
