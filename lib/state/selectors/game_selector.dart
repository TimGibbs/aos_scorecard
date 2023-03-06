import 'package:aos_scorecard/models/game.dart';
import 'package:aos_scorecard/models/app_state.dart';
import 'package:redux/redux.dart';

Game gameSelector(Store<AppState> store) => store.state.game;
