import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class VolutaCards {
  static getContainer(Widget child) => Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)));
  static getBasicCard(String label, Function onTapped, {Widget trailing}) =>
      Padding(
        child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTapped,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    VolutaText.body1(label, height: 1),
                    trailing != null
                        ? trailing
                        : Icon(Icons.chevron_right_rounded,
                            color: Palette.gold60, size: 32)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8)))),
        padding: EdgeInsets.only(top: 16, bottom: 8),
      );
}
