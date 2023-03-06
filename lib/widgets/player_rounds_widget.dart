import 'package:aos_scorecard/extensions/capitalize.dart';
import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:aos_scorecard/state/selectors/game_selector.dart';
import 'package:aos_scorecard/widgets/player_round_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PlayerRoundsWidget extends StatelessWidget {
  PlayerRoundsWidget({super.key, required this.playerside}) {
    color = playerside == PlayerSide.attacker ? Colors.red : Colors.blue;
  }
  final PlayerSide playerside;
  late Color color;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Game>(
        converter: gameSelector,
        builder: (context, game) {
          int pts = playerside == PlayerSide.attacker
              ? game.attackerPoints()
              : game.defenderPoints();

          return Card(
              elevation: 3,
              color: color.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      '${playerside.name.capitalize()} ($pts)',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  PlayerRoundWidget(
                    round: 1,
                    playerside: playerside,
                  ),
                  PlayerRoundWidget(
                    round: 2,
                    playerside: playerside,
                  ),
                  PlayerRoundWidget(
                    round: 3,
                    playerside: playerside,
                  ),
                  PlayerRoundWidget(
                    round: 4,
                    playerside: playerside,
                  ),
                  PlayerRoundWidget(
                    round: 5,
                    playerside: playerside,
                  ),
                ],
              ));
        });
  }
}
