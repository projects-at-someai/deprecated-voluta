part of 'item.dart';

class TattooInk extends StudioItem {
  String brand;
  String family;
  String color;

  TattooInk(this.brand, this.family, this.color);

  @override
  toJSON() => {
        'brand': this.brand,
        'family': this.family,
        'color': this.color,
        '_str': this.toString()
      };

  factory TattooInk.fromJSON(Map<String, String> json) =>
      new TattooInk(json['brand'], json['family'], json['color']);

  factory TattooInk.fromString(String csv) =>
      new TattooInk(csv.split(";")[0], csv.split(";")[1], csv.split(";")[2]);

  static bool isValid(String value) => value.split(";").length == 3;

  String toString() => '$brand; $family; $color';

  static Future<List<TattooInk>> dialog(
          BuildContext context, List<TattooInk> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              new StudioItemDialog(items, "TattooInk", "INK LIST", "NEW INK"));
}
