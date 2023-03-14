import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/state/app_state.dart';
import 'package:redux/redux.dart';

Game gameSelector(Store<AppState> store) => store.state.game;
