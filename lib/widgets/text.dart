import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluta_digital_trf/ui/palette.dart';

class VolutaText {
  static Widget display(String text, {Color color}) => Padding(
      child: Text(text.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
              color: color ?? Palette.gold60,
              fontSize: 48,
              fontWeight: FontWeight.w300)),
      padding: EdgeInsets.all(16));

  static Widget h1(String text, {Color color}) => Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(text.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
              color: color ?? Palette.gold60, fontSize: 32)));

  static Widget h2(String text, {Color color}) => Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Text(text.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
              color: color ?? Palette.gold60, fontSize: 24)));

  static Widget h3(String text, {Color color}) => Padding(
      padding: EdgeInsets.zero,
      child: Text(text.toUpperCase(),
          style: GoogleFonts.barlowCondensed(
              color: color ?? Palette.gold60, fontSize: 18)));

  static Widget body1(String text,
          {bool center = false,
          double height = 2,
          Color color = Colors.white}) =>
      Text(text,
          textAlign: center ? TextAlign.center : null,
          style: GoogleFonts.lato(color: color, fontSize: 16, height: height));

  static Widget header(BuildContext context, String title,
          {bool back = false}) =>
      Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    back ? Icons.chevron_left : Icons.close,
                    size: 32,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  color: Palette.gold60),
              VolutaText.display(title),
              Container(width: 0, height: 0)
            ],
          ),
          margin: EdgeInsets.only(top: 32));
}
