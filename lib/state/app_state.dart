import 'package:meta/meta.dart';
import 'package:aos_scorecard/models/game.dart';

@immutable
class AppState {
  late final Game game;
  late final String gameToLoad;

  AppState({Game? game, this.gameToLoad = ''}) {
    this.game = game ?? Game.newGame();
  }

  factory AppState.initial() => AppState(game: Game.newGame());

  @override
  int get hashCode => game.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          game == other.game &&
          gameToLoad == other.gameToLoad;

  @override
  String toString() {
    return 'AppState{ game: $game, gameToLoad: $gameToLoad }';
  }
}
