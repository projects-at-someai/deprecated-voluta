import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluta_digital_trf/ui/palette.dart';

class VolutaButtons {
  static Widget logoSmall(BuildContext context) {
    return Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/logo.png"))));
  }

  static Widget logoMedium(BuildContext context) {
    return Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/logo.png"))));
  }

  static Widget text(BuildContext context, Function onPressed, String text) {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Palette.backgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Palette.softHighlightColor,
                      offset: Offset(-8, -8),
                      spreadRadius: 0,
                      blurRadius: 8),
                  BoxShadow(
                      color: Palette.softShadowColor,
                      offset: Offset(8, 8),
                      spreadRadius: 0,
                      blurRadius: 8)
                ]),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Palette.gold60,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ))),
        onTap: onPressed);
  }

  static Widget primary(
      BuildContext context, Function onPressed, Widget child) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            child: child,
            margin: EdgeInsets.only(top: 12, bottom: 12),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Palette.gold60)));
  }

  static Widget icon(BuildContext context, Function onPressed, Widget icon) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Palette.backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Palette.softHighlightColor,
                  offset: Offset(-8, -8),
                  spreadRadius: 0,
                  blurRadius: 8),
              BoxShadow(
                  color: Palette.softShadowColor,
                  offset: Offset(8, 8),
                  spreadRadius: 0,
                  blurRadius: 8)
            ]),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
                onTap: onPressed,
                splashColor: Palette.gold30,
                highlightColor: Palette.gold60,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: icon,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Palette.gold60, width: 2)),
                ))));
  }

  static Widget secondary(
      BuildContext context, Function onPressed, Widget child) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          child: child,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Palette.gold60, width: 2)),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ));
  }

  static Widget primaryWithSubtitle(
      BuildContext context, Function onPressed, String title, String subtitle) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Palette.gold60),
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.barlowCondensed(
                            color: Palette.white, fontSize: 32))),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.lato(color: Palette.grey60, fontSize: 16))
              ],
              mainAxisSize: MainAxisSize.min,
            )));
  }

  static Widget secondaryWithSubtitle(
      BuildContext context, Function onPressed, String title, String subtitle) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Palette.gold60, width: 2)),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 100),
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.barlowCondensed(
                            color: Palette.gold60, fontSize: 32))),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(color: Palette.white, fontSize: 16))
              ],
              mainAxisSize: MainAxisSize.min,
            )));
  }
}
