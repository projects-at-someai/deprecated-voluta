import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class Palette {
  static const Color neutral_white = Color(0xFFe8e8e8);
  static Color get white => neutral_white;
  static BoxDecoration get background =>
      BoxDecoration(color: Palette.backgroundColor);
  // gradient: LinearGradient(
  //     colors: [grey60, grey100],
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight));

  static BoxDecoration get drawer => BoxDecoration(
      gradient: LinearGradient(
          colors: [grey80, grey100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));

  static BoxDecoration get showcase => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
          colors: [grey60, grey100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));
  static const Color primaryGrey = Color(0xFF3a383a);
  static Color get grey10 => tintColor(primaryGrey, 0.9);
  static Color get grey20 => tintColor(primaryGrey, 0.7);
  static Color get grey30 => tintColor(primaryGrey, 0.5);
  static Color get grey40 => tintColor(primaryGrey, 0.3);
  static Color get grey50 => tintColor(primaryGrey, 0.1);
  static Color get grey60 => primaryGrey;
  static Color get grey70 => shadeColor(primaryGrey, 0.1);
  static Color get grey80 => shadeColor(primaryGrey, 0.3);
  static Color get grey90 => shadeColor(primaryGrey, 0.5);
  static Color get grey100 => shadeColor(primaryGrey, 0.7);
  List<Color> get greys => [
        grey10,
        grey20,
        grey30,
        grey40,
        grey50,
        grey60,
        grey70,
        grey80,
        grey90,
        grey100
      ];

  static const Color primaryRed = Color(0xffF71735);
  static Color get red10 => tintColor(primaryRed, 0.9);
  static Color get red20 => tintColor(primaryRed, 0.7);
  static Color get red30 => tintColor(primaryRed, 0.5);
  static Color get red40 => tintColor(primaryRed, 0.3);
  static Color get red50 => tintColor(primaryRed, 0.1);
  static Color get red60 => primaryRed;
  static Color get red70 => shadeColor(primaryRed, 0.1);
  static Color get red80 => shadeColor(primaryRed, 0.3);
  static Color get red90 => shadeColor(primaryRed, 0.5);
  static Color get red100 => shadeColor(primaryRed, 0.7);
  List<Color> get reds =>
      [red10, red20, red30, red40, red50, red60, red70, red80, red90, red100];

  static const Color primaryGold = Color(0xffc0a36c);
  static Color get gold10 => tintColor(primaryGold, 0.9);
  static Color get gold20 => tintColor(primaryGold, 0.7);
  static Color get gold30 => tintColor(primaryGold, 0.5);
  static Color get gold40 => tintColor(primaryGold, 0.3);
  static Color get gold50 => tintColor(primaryGold, 0.1);
  static Color get gold60 => primaryGold;
  static Color get gold70 => shadeColor(primaryGold, 0.1);
  static Color get gold80 => shadeColor(primaryGold, 0.3);
  static Color get gold90 => shadeColor(primaryGold, 0.5);
  static Color get gold100 => shadeColor(primaryGold, 0.7);
  List<Color> get golds => [
        gold10,
        gold20,
        gold30,
        gold40,
        gold50,
        gold60,
        gold70,
        gold80,
        gold90,
        gold100
      ];

  static const Color primaryGreen = Color(0xff259c07);
  static Color get green10 => tintColor(primaryGreen, 0.9);
  static Color get green20 => tintColor(primaryGreen, 0.7);
  static Color get green30 => tintColor(primaryGreen, 0.5);
  static Color get green40 => tintColor(primaryGreen, 0.3);
  static Color get green50 => tintColor(primaryGreen, 0.1);
  static Color get green60 => primaryGreen;
  static Color get green70 => shadeColor(primaryGreen, 0.1);
  static Color get green80 => shadeColor(primaryGreen, 0.3);
  static Color get green90 => shadeColor(primaryGreen, 0.5);
  static Color get green100 => shadeColor(primaryGreen, 0.7);
  List<Color> get greens => [
        green10,
        green20,
        green30,
        green40,
        green50,
        green60,
        green70,
        green80,
        green90,
        green100
      ];

  //? Helpers to generate  Tints and Shades
  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
  static Color get backgroundColor => Palette.grey80;
  static Color get highlightColor => Palette.grey70;
  static Color get shadowColor => Palette.grey90;

  static Color get softHighlightColor =>
      Palette.highlightColor.withOpacity(0.3);
  static Color get softShadowColor => Palette.shadowColor.withOpacity(0.3);
}
