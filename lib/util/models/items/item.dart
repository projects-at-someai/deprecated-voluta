import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:voluta_digital_trf/widgets/dialog.dart';
import 'package:voluta_digital_trf/widgets/forms.dart';
import 'package:voluta_digital_trf/widgets/text.dart';
part 'artist.dart';
part 'clause.dart';

part 'grip.dart';
part 'health.dart';
part 'ink.dart';
part 'needle.dart';
part 'salve.dart';
part 'thinner.dart';
part 'tube.dart';

abstract class StudioItem {
  String id;
  toJSON() => {};
  static isValid(String value) => true;

  static Future<void> dialog(BuildContext context, List items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              new StudioItemDialog(items, "N/A", "ITEM LIST", "NEW ITEM"));
}
