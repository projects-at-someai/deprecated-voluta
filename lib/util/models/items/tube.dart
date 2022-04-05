part of 'item.dart';

class DisposableTube extends StudioItem {
  String label;
  DisposableTube(this.label);

  @override
  toJSON() => {'_str': this.toString(), 'label': this.label};

  factory DisposableTube.fromJSON(Map<String, String> json) =>
      new DisposableTube(json['label']);

  factory DisposableTube.fromString(String csv) =>
      new DisposableTube(csv.split(";")[0]);
  static bool isValid(String value) => true;

  toString() => '$label';

  static Future<List<DisposableTube>> dialog(
          BuildContext context, List<DisposableTube> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(items, "DisposableTube",
              "DISPOSABLE TUBE LIST", "NEW DISPOSABLE TUBE"));
}
