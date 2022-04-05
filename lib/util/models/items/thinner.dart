part of 'item.dart';

class InkThinner extends StudioItem {
  String label;
  InkThinner(this.label);

  @override
  toJSON() => {'label': this.label, '_str': this.toString()};

  factory InkThinner.fromJSON(Map<String, String> json) =>
      new InkThinner(json['label']);

  factory InkThinner.fromString(String csv) =>
      new InkThinner(csv.split(";")[0]);

  static bool isValid(String value) => true;
  toString() => '$label';

  static Future<List<InkThinner>> dialog(
          BuildContext context, List<InkThinner> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(
              items, "InkThinner", "INK THINNER LIST", "NEW INK THINNER"));
}
