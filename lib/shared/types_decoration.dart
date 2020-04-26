import 'package:flutter/material.dart';

class TypeDecoration {

  static double _opacity = 0.85;

  Map<String, Map> _typesDecorations = {
    "grass": {
      "cardColor": Color(0xFF8BD674).withOpacity(0.85),
      "chipColor": Color(0xFF8BD674),
    },
    "fire": {
      "cardColor": Color(0xFFFFA756).withOpacity(0.85),
      "chipColor": Color(0xFFFFA756),
    },
    "water": {
      "cardColor": Color(0xFF58ABF6).withOpacity(0.85),
      "chipColor": Color(0xFF58ABF6),
    },
    "fighting": {
      "cardColor": Color(0xFFEB4971).withOpacity(0.85),
      "chipColor": Color(0xFFEB4971),
    },
    "poison": {
      "cardColor": Color(0xFF9C3E9E).withOpacity(0.85),
      "chipColor": Color(0xFF9C3E9E),
    },
    "flying": {
      "cardColor": Color(0xFF41908E).withOpacity(0.85),
      "chipColor": Color(0xFF41908E),
    },
    "bug": {
      "cardColor": Color(0xFF8CB331).withOpacity(0.85),
      "chipColor": Color(0xFF8CB331),
    },
    "normal": {
      "cardColor": Color(0xFFA4ACAF).withOpacity(0.85),
      "chipColor": Color(0xFFA4ACAF),
    },
    "electric": {
      "cardColor": Color(0xFFF2CB55).withOpacity(0.85),
      "chipColor": Color(0xFFF2CB55),
    },
    "ground": {
      "cardColor": Color(0xFFF78551).withOpacity(0.85),
      "chipColor": Color(0xFFF78551),
    },
    "fairy": {
      "cardColor": Color(0xFFFDB9E9).withOpacity(0.85),
      "chipColor": Color(0xFFFDB9E9),
    },
    "ground": {
      "cardColor": Color(0xFFF78551).withOpacity(0.85),
      "chipColor": Color(0xFFF78551),
    },
  };

  Color getCardColor(String type) =>
      _typesDecorations[type]["cardColor"] ?? Colors.white;
  Color getChipColor(String type) => _typesDecorations[type]["chipColor"];
}
