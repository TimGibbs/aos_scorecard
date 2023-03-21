import 'package:aos_scorecard/data/battle_plan_repository.dart';
import 'package:aos_scorecard/state/actions/game/set_battleplan_action.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BattlePlanDialog extends StatefulWidget {
  const BattlePlanDialog({Key? key, required this.gameVersion})
      : super(key: key);
  final String gameVersion;
  @override
  State<StatefulWidget> createState() => _BattlePlanDialogState();
}

class _BattlePlanDialogState extends State<BattlePlanDialog> {
  String selectedValue = "";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems =
        BattlePlanRepository.battlePlansForGameVersion(widget.gameVersion)
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList();
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: DropdownButton(
        value: selectedValue,
        items: dropdownItems,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value!;
          });
        },
      ),
      contentTextStyle: Theme.of(context).textTheme.bodyMedium,
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () {
            StoreProvider.of<AppState>(context)
                .dispatch(SetBattlePlanAction(selectedValue));
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
