part of 'item.dart';

class Artist extends StudioItem {
  String name;
  String id;
  Artist(this.name, {this.id}) {
    if (this.id == null) this.id = Uuid().v1();
  }

  @override
  Map<String, String> toJSON() => {'name': this.name};

  factory Artist.fromJSON(Map<String, String> json) => new Artist(json['name']);
  factory Artist.fromString(String csv) => new Artist(csv.split(";")[0]);
  static bool isValid(String value) => true;
  String toString() => '$name';

  static Future<List<Artist>> dialog(
          BuildContext context, List<Artist> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(
              items, "Artist", "ARTIST LIST", "NEW ARTIST"));
}
