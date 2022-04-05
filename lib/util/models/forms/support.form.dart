import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class SupportForm {
  String firstName;
  String lastName;
  String email;
  String body;
  String supportId;
  SupportForm(
      this.supportId, this.firstName, this.lastName, this.email, this.body);

  factory SupportForm.instance() =>
      new SupportForm(Uuid().v1(), "", "", "", "");
  Map<String, dynamic> toJSON() => {
        "supportId": supportId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "body": body,
        "timestamp": FieldValue.serverTimestamp()
      };

  submit() async {
    FirebaseFirestore.instance
        .collection("support")
        .doc(supportId)
        .set(this.toJSON());
  }
}
