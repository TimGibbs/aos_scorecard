import 'package:aos_scorecard/data/game_repository.dart';
import 'package:aos_scorecard/state/actions/game/change_game_action.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'game_load.dart';

class GameLoadDialog extends StatefulWidget {
  const GameLoadDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameLoadDialogState();
}

class _GameLoadDialogState extends State<GameLoadDialog> {
  @override
  Widget build(BuildContext context) {
    var g = GameRepository();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      content: SizedBox(
          height: 250,
          width: 50,
          child: FutureBuilder(
            future: g.gamesDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GameLoad(games: snapshot.data ?? []);
              } else if (snapshot.hasError) {
                throw Exception("uh oh");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
      actions: [
        TextButton(
          child: const Text("Load"),
          onPressed: () async {
            var g = GameRepository();
            var game = await g
                .loadGame(StoreProvider.of<AppState>(context).state.gameToLoad);
            // ignore: use_build_context_synchronously
            StoreProvider.of<AppState>(context)
                .dispatch(ChangeGameAction(game!));
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
