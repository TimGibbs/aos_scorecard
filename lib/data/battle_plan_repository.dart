class BattlePlanRepository {
  static List<String> battlePlansForGameVersion(String gameVersion) {
    switch (gameVersion) {
      case '3.3':
        return const [
          "",
          "THE PRIZE OF GALLET",
          "THE REALMSTONE CACHE",
          "BATTLELINES DRAWN",
          "THE LURKERS BELOW",
          "IN THE PRESENCE OF IDOLS",
          "THE NIDUS PATHS",
          "ONLY THE WORTHY",
          "PATH OF A CHAMPION",
          "THE JAWS OF GALLET",
          "OURS FOR THE TAKING",
          "TWISTS AND TURNS",
          "POSITION OVER POWER"
        ];
    }
    return const [];
  }
}
