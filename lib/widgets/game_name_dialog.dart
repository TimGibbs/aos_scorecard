import 'package:aos_scorecard/data/game_repository.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:aos_scorecard/state/actions/game/name_game_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameNameDialog extends StatefulWidget {
  const GameNameDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameNameDialogState();
}

class _GameNameDialogState extends State<GameNameDialog> {
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Name',
        ),
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyMedium,
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: [
        TextButton(
          child: const Text("Save"),
          onPressed: () {
            StoreProvider.of<AppState>(context)
                .dispatch(NameGameAction(_nameController.value.text));
            var g = GameRepository();
            g.addOrUpdate(StoreProvider.of<AppState>(context).state.game);
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
