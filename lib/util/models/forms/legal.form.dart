part of 'form.dart';

class LegalForm {
  LegalForm();
  factory LegalForm.fromJSON(Map<String, dynamic> json) => new LegalForm();
  Map<String, dynamic> toJSON() => {};


  factory LegalForm.instance() => new LegalForm();
}
