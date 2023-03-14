import 'package:aos_scorecard/data/game_repository.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/state/actions/game/name_game_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameSaveDialog extends StatefulWidget {
  const GameSaveDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameSaveDialogState();
}

class _GameSaveDialogState extends State<GameSaveDialog> {
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
          onPressed: () async {
            StoreProvider.of<AppState>(context)
                .dispatch(NameGameAction(_nameController.value.text));
            var g = GameRepository();
            await g.addOrUpdate(StoreProvider.of<AppState>(context).state.game);
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
