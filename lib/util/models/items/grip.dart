part of 'item.dart';

class DisposableGrip extends StudioItem {
  String label;
  DisposableGrip(this.label);

  @override
  toJSON() => {'_str': this.toString(), 'label': this.label};

  factory DisposableGrip.fromJSON(Map<String, String> json) =>
      new DisposableGrip(json['label']);

  factory DisposableGrip.fromString(String csv) =>
      new DisposableGrip(csv.split(";")[0]);
  static bool isValid(String value) => true;

  toString() => '$label';

  static Future<List<DisposableGrip>> dialog(
          BuildContext context, List<DisposableGrip> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(items, "DisposableGrip",
              "DISPOSABLE GRIP LIST", "NEW DISPOSABLE GRIP"));
}
