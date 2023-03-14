import 'package:aos_scorecard/state/actions/game/new_game_action.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/widgets/game_load/game_load_dialog.dart';
import 'package:aos_scorecard/widgets/game_save_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AosAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AosAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'AoS Scorecard',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () =>
                StoreProvider.of<AppState>(context).dispatch(NewGameAction()),
            icon: const Icon(Icons.fiber_new_outlined)),
        IconButton(
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const GameSaveDialog();
                      })
                },
            icon: const Icon(Icons.save)),
        IconButton(
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const GameLoadDialog();
                      })
                },
            icon: const Icon(Icons.drive_folder_upload_outlined)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
