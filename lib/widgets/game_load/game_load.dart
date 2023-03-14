import 'package:aos_scorecard/models/game_details_vm.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/widgets/game_load/game_load_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameLoad extends StatelessWidget {
  const GameLoad({super.key, required this.games});

  final List<GameDetailsVM> games;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
        converter: (store) => store.state.gameToLoad,
        builder: (context, id) {
          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              return GameLoadItem(
                  game: games[index], isSelected: games[index].id == id);
            },
          );
        });
  }
}
