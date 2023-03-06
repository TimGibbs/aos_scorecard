import 'package:aos_scorecard/models/player_round.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/state/actions/game/set_battle_tactic_action.dart';
import 'package:aos_scorecard/state/actions/game/set_battle_tactic_complete_action.dart';
import 'package:aos_scorecard/state/actions/game/set_objective_points_action.dart';
import 'package:aos_scorecard/state/actions/game/switch_first_player_action.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:aos_scorecard/state/selectors/player_round_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PlayerRoundWidget extends StatefulWidget {
  const PlayerRoundWidget({
    super.key,
    required this.round,
    required this.playerside,
  });
  final int round;
  final PlayerSide playerside;

  @override
  State<StatefulWidget> createState() => _PlayerRoundWidgetState();
}

class _PlayerRoundWidgetState extends State<PlayerRoundWidget> {
  final TextEditingController _btController = TextEditingController();
  final TextEditingController _obvjController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme.labelLarge;
    InputDecoration decoration(String str) => InputDecoration(
          hintText: str,
          contentPadding: const EdgeInsets.all((1)),
          isDense: true,
        );
    return StoreConnector<AppState, PlayerRound>(
        converter: (store) =>
            playerRoundSelector(store, widget.playerside, widget.round),
        builder: (context, playerRound) {
          return Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(32),
              1: FlexColumnWidth(),
              2: FixedColumnWidth(64),
              3: FixedColumnWidth(64),
              4: FixedColumnWidth(64),
              5: FixedColumnWidth(64),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  Text(
                    widget.round.toString(),
                    style: textstyle,
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: _btController,
                    textAlign: TextAlign.center,
                    style: textstyle,
                    decoration: decoration('Battle Tactic'),
                    onSubmitted: (value) => StoreProvider.of<AppState>(context)
                        .dispatch(SetBattleTacticAction(
                            round: widget.round,
                            playerSide: widget.playerside,
                            battleTactic: value)),
                  ),
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: playerRound.wasBattleTacticCompleted,
                    onChanged: (bool? value) =>
                        StoreProvider.of<AppState>(context).dispatch(
                            SetBattleTacticCompleteAction(
                                round: widget.round,
                                playerSide: widget.playerside,
                                battleTacticComplete: value ?? false)),
                  ),
                  TextField(
                    controller: _obvjController,
                    textAlign: TextAlign.center,
                    style: textstyle,
                    onSubmitted: (value) => StoreProvider.of<AppState>(context)
                        .dispatch(SetObjectivePointsAction(
                            round: widget.round,
                            playerSide: widget.playerside,
                            objectivePoints:
                                value != '' ? int.parse(value) : 0)),
                    decoration: decoration('pts'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                  Text(
                    playerRound.roundPoints().toString(),
                    style: textstyle,
                    textAlign: TextAlign.center,
                  ),
                  Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: !playerRound.wentFirst,
                      thumbColor:
                          const MaterialStatePropertyAll<Color>(Colors.black45),
                      trackColor: const MaterialStatePropertyAll<Color>(
                          Colors.lightBlue),
                      onChanged: (bool value) =>
                          StoreProvider.of<AppState>(context)
                              .dispatch(SwitchFirstPlayerAction(
                            fromRound: widget.round,
                          ))),
                ],
              ),
            ],
          );
        });
  }
}
