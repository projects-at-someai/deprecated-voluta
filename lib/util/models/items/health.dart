part of 'item.dart';

class HealthResponse {
  String response;
  HealthQuestion question;
  bool valid() => true;
  factory HealthResponse.fromJSON(Map<String, dynamic> json) =>
      new HealthResponse(HealthQuestion.fromJSON(json['question']),
          response: json['response']);

  HealthResponse(this.question, {this.response = ""});
  Map<String, dynamic> toJSON() =>
      {"response": response, 'question': question.toJSON()};
  
}

class HealthQuestion extends StudioItem {
  String label;
  String section;
  String type;
  String required;
  HealthQuestion(this.label, this.section, this.type, this.required);

  @override
  toJSON() => {
        'label': this.label,
        'type': this.type,
        'section': this.section,
        'required': this.required,
        '_str': this.toString()
      };

  factory HealthQuestion.fromJSON(Map<String, dynamic> json) =>
      new HealthQuestion(
          json['label'], json['section'], json['type'], json['required']);

  factory HealthQuestion.fromString(String csv) => new HealthQuestion(
      csv.split(";")[0],
      csv.split(";")[1],
      csv.split(";")[2],
      csv.split(";")[3]);

  bool isRequired() => this.required == "yes";

  static bool isValid(String value) => value.split(";").length == 4;

  String toString() => '$label; $type; $section; $required';

  static Future<List<HealthQuestion>> dialog(
          BuildContext context, List<HealthQuestion> items) async =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => new StudioItemDialog(items, "HealthQuestion",
              "HEALTH QUESTION LIST", "NEW HEALTH QUESTION"));
}
