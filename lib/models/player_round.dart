class PlayerRound {
  final int roundNumber;
  String? battleTactic;
  bool wasBattleTacticCompleted;
  int objectivePoints;
  bool wentFirst;

  PlayerRound({
    required this.roundNumber,
    this.battleTactic,
    this.wasBattleTacticCompleted = false,
    this.objectivePoints = 0,
    this.wentFirst = true,
  });

  PlayerRound.existing({
    required this.roundNumber,
    required this.battleTactic,
    required this.wasBattleTacticCompleted,
    required this.objectivePoints,
    required this.wentFirst,
  });

  Map<String, dynamic> toJson() => {
        'roundNumber': roundNumber,
        'battleTactic': battleTactic,
        'wasBattleTacticCompleted': wasBattleTacticCompleted,
        'objectivePoints': objectivePoints,
        'wentFirst': wentFirst
      };

  int roundPoints() {
    int i = 0;
    if (wasBattleTacticCompleted) {
      i += 2;
    }
    i += objectivePoints;
    return i;
  }
}
