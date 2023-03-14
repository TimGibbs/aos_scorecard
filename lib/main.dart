import 'package:aos_scorecard/state/app_state.dart';
import 'package:aos_scorecard/state/reducers/app_state_reducer.dart';
import 'package:aos_scorecard/widgets/aos_scorecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
  );

  runApp(StoreProvider<AppState>(store: store, child: const AosScorecard()));
}
