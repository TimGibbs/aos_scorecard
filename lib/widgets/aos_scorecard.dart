import 'package:aos_scorecard/widgets/aos_app_bar.dart';
import 'package:aos_scorecard/widgets/game_widget.dart';
import 'package:flutter/material.dart';

class AosScorecard extends StatelessWidget {
  const AosScorecard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AoS Scorecard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: const AosAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              GameWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
