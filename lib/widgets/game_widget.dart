import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/state/actions/game/set_battleplan_action.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/state/selectors/game_selector.dart';
import 'package:aos_scorecard/widgets/battleplan_dialog.dart';
import 'package:aos_scorecard/widgets/player_rounds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final TextEditingController _battleplanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Game>(
      converter: gameSelector,
      builder: (context, game) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              game.name ?? game.id,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextButton(
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BattlePlanDialog(
                        gameVersion: game.gameVersion,
                      );
                    })
              },
              child: new Text(game.battlePlan ?? 'Battle Plan'),
            ),
            PlayerRoundsWidget(
              playerside: PlayerSide.attacker,
            ),
            PlayerRoundsWidget(
              playerside: PlayerSide.defender,
            ),
          ],
        );
      },
    );
  }
}
