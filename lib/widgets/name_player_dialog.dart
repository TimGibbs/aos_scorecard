import 'package:aos_scorecard/extensions/capitalize.dart';
import 'package:aos_scorecard/models/player_side.dart';
import 'package:aos_scorecard/state/actions/game/set_player_name_action.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NamePlayerDialog extends StatefulWidget {
  const NamePlayerDialog({
    Key? key,
    required this.playerSide,
  }) : super(key: key);

  final PlayerSide playerSide;
  @override
  State<StatefulWidget> createState() => _NamePlayerDialogState();
}

class _NamePlayerDialogState extends State<NamePlayerDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text =
        StoreProvider.of<AppState>(context).state.game.name ?? "";
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: TextField(
        controller: _nameController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '${widget.playerSide.name.capitalize()} Name',
        ),
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyMedium,
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () {
            StoreProvider.of<AppState>(context).dispatch(SetPlayerNameAction(
                _nameController.value.text, widget.playerSide));
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
