part of 'form.dart';

class HealthForm {
  List<HealthResponse> responses;
  HealthForm(this.responses);
  factory HealthForm.fromJSON(Map<String, dynamic> json) =>
      new HealthForm((json['responses'] as List<Map<String, dynamic>>)
          .map((data) => new HealthResponse.fromJSON(data)));

  Map<String, dynamic> toJSON() =>
      {"responses": responses.map((response) => response.toJSON()).toList()};

  factory HealthForm.instance(VolutaStudio studio) =>
      new HealthForm(studio.healthQuestions
          .map((hq) =>
              HealthResponse(hq, response: hq.type == "Textfield" ? '' : "No"))
          .toList());
}
