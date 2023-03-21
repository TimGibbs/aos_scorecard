class BattleTacticRepository {
  List<String> battleTacticsForGameVersion(String gameVersion) {
    switch (gameVersion) {
      case '3.3':
        return const [
          "",
          "Gaining Momentum",
          "An Eye for an Eye",
          "Desecrate their Lands",
          "This One’s Mine",
          "A Matter of Honour",
          "Lead the Assault",
          "United Offence",
          "Cunning Manoeuvre",
        ];
    }
    return const [];
  }
}
