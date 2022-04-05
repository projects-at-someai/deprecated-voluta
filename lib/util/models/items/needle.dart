part of 'item.dart';

class Needle extends StudioItem {
  String configuration;
  String type;
  String size;
  Needle(this.configuration, this.type, this.size);

  @override
  toJSON() => {
        'configuration': this.configuration,
        'type': this.type,
        'size': this.size,
        '_str': this.toString()
      };

  factory Needle.fromJSON(Map<String, String> json) =>
      new Needle(json['configuration'], json['type'], json['size']);

  factory Needle.fromString(String csv) =>
      new Needle(csv.split(";")[0], csv.split(";")[1], csv.split(";")[2]);

  static bool isValid(String value) => value.split(";").length == 3;

  toString() => '$configuration; $type; $size';

  static Future<List<Needle>> dialog(BuildContext context, List<Needle> items) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(
              items, "Needle", "NEEDLE LIST", "NEW NEEDLE"));
}
