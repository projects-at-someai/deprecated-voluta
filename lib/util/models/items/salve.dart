part of 'item.dart';

class Salve extends StudioItem {
  String label;
  Salve(this.label);

  @override
  toJSON() => {'_str': this.toString(), 'label': this.label};

  factory Salve.fromJSON(Map<String, String> json) => new Salve(json['label']);

  factory Salve.fromString(String csv) => new Salve(csv.split(";")[0]);
  static bool isValid(String value) => true;

  toString() => '$label';

  static Future<List<Salve>> dialog(BuildContext context, List<Salve> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              new StudioItemDialog(items, "Salve", "SALVE LIST", "NEW SALVE"));
}
