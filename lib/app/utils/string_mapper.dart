import 'package:pokedex_f/data/models/stat.dart';

class StringMapper {
  static String mapStatNameToAbr(Stat stat) {
    String statAbr;
    switch (stat.stat?.name?.toLowerCase()) {
      case "hp":
        statAbr = "HP";
        break;
      case "attack":
        statAbr = "ATK";
        break;
      case "defense":
        statAbr = "DEF";
        break;
      case "special-attack":
        statAbr = "SPATK";
        break;
      case "special-defense":
        statAbr = "SPDEF";
        break;
      case "speed":
        statAbr = "SPD";
        break;
      default:
        statAbr = "";
    }
    return statAbr;
  }
}
