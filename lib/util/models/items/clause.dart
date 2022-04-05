part of 'item.dart';

class LegalClause extends StudioItem {
  String clause;
  LegalClause(this.clause);

  @override
  toJSON() => {'clause': this.clause, '_str': this.toString()};

  factory LegalClause.fromJSON(Map<String, String> json) =>
      new LegalClause(json['clause']);

  factory LegalClause.fromString(String csv) =>
      new LegalClause(csv.split(";")[0]);

  static bool isValid(String value) => true;

  String toString() => '$clause';
  static Future<List<LegalClause>> dialog(
          BuildContext context, List<LegalClause> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(
              items, "LegalClause", "LEGAL CLAUSE LIST", "NEW CLAUSE"));
}
