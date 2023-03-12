import 'package:aos_scorecard/data/game_repository.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:aos_scorecard/state/actions/game/name_game_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
      content: FutureBuilder(
        future: g.gamesDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              height: 250,
              width: 50,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  //debugPrint(snapshot.data![index].name);
                  return Text(snapshot.data![index].name);
                },
              ),
            );
          } else if (snapshot.hasError) {
            throw Exception("uh oh");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      actions: [
        TextButton(
          child: const Text("Load"),
          onPressed: () {
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
