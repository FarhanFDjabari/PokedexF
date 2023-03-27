import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/data/models/stat.dart';
import 'package:pokedex_f/data/models/type.dart' as t;

class ColorMapper {
  static Color mapTypeToColor(t.Type pokemonType) {
    Color parsedColor;
    switch (pokemonType.type?.name?.toLowerCase()) {
      case "normal":
        parsedColor = typeNormal;
        break;
      case "fire":
        parsedColor = typeFire;
        break;
      case "water":
        parsedColor = typeWater;
        break;
      case "electric":
        parsedColor = typeElectric;
        break;
      case "grass":
        parsedColor = typeGrass;
        break;
      case "ice":
        parsedColor = typeIce;
        break;
      case "fighting":
        parsedColor = typeFighting;
        break;
      case "poison":
        parsedColor = typePoison;
        break;
      case "ground":
        parsedColor = typeGround;
        break;
      case "flying":
        parsedColor = typeFlying;
        break;
      case "psychic":
        parsedColor = typePsychic;
        break;
      case "bug":
        parsedColor = typeBug;
        break;
      case "rock":
        parsedColor = typeRock;
        break;
      case "ghost":
        parsedColor = typeGhost;
        break;
      case "dragon":
        parsedColor = typeDragon;
        break;
      case "dark":
        parsedColor = typeDark;
        break;
      case "steel":
        parsedColor = typeSteel;
        break;
      case "fairy":
        parsedColor = typeFairy;
        break;
      default:
        parsedColor = const Color(0xFF000000);
    }
    return parsedColor;
  }

  static Color mapStatToColor(Stat stat) {
    Color parsedColor;
    switch (stat.stat?.name?.toLowerCase()) {
      case "hp":
        parsedColor = hpColor;
        break;
      case "attack":
        parsedColor = atkColor;
        break;
      case "defense":
        parsedColor = defColor;
        break;
      case "special-attack":
        parsedColor = spAtkColor;
        break;
      case "special-defense":
        parsedColor = spDefColor;
        break;
      case "speed":
        parsedColor = spdColor;
        break;
      default:
        parsedColor = const Color(0xFFFFFFFF);
    }
    return parsedColor;
  }

  static Future<Color> getDominantColor(String imageUrl) async {
    try {
      final paletteData = await PaletteGenerator.fromImageProvider(
        Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) =>
              const ColoredBox(color: kGreyColor),
        ).image,
      );

      return paletteData.lightVibrantColor?.color ?? kGreyColor;
    } catch (e) {
      return kGreyColor;
    }
  }

  static Future<List<Color>> getDominantColors(List<String> imageUrls) async {
    final result = await Future.wait(
      imageUrls.map((e) async {
        return await getDominantColor(e);
      }),
    );

    return result;
  }
}
