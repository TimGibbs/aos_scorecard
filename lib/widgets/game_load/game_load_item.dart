import 'package:aos_scorecard/models/game_details_vm.dart';
import 'package:aos_scorecard/state/actions/gameToLoad/set_game_to_load.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameLoadItem extends StatelessWidget {
  const GameLoadItem({super.key, required this.isSelected, required this.game});
  final bool isSelected;
  final GameDetailsVM game;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: isSelected ? Colors.amber : Colors.white,
        child: ListTile(
          onTap: () {
            StoreProvider.of<AppState>(context)
                .dispatch(SetGameToLoadAction(game.id));
          },
          title: Text(game.title),
        ));
  }
}
