import 'package:cloud_firestore/cloud_firestore.dart';

import 'forms/form.dart';
import 'studio.dart';

class VolutaClient {
  ClientForm client;
  SocialForm social;
  HealthForm health;
  List<SessionForm> sessions;
  List<String> studios;
  List<String> forms;
  VolutaClient(this.client, this.social, this.health, this.sessions,
      this.studios, this.forms);

  Map<String, dynamic> toJSON() => {
        "client": client.toJSON(),
        "social": social.toJSON(),
        "health": health.toJSON(),
        "sessions": sessions.map((session) => session.toJSON()).toList(),
        "studios": studios,
        "forms": forms,
      };

  factory VolutaClient.fromJSON(Map<String, dynamic> json) => new VolutaClient(
      new ClientForm.fromJSON(json['client']),
      new SocialForm.fromJSON(json['social']),
      new HealthForm.fromJSON(json['health']),
      (json['sessions'] as List<Map<String, dynamic>>)
          .map((data) => new SessionForm.fromJSON(data))
          .toList(),
      json['studios'],
      json['forms']);

  factory VolutaClient.create(VolutaStudio studio) => new VolutaClient(
      new ClientForm.create(),
      SocialForm.instance(),
      HealthForm.instance(studio),
      [],
      [studio.id],
      []);

  addFormToClient(VolutaForm form) async {
    FirebaseFirestore.instance
        .collection("client")
        .doc(client.clientId)
        .update({
      "sessions": FieldValue.arrayUnion([form.session.toJSON()]),
      "studios": FieldValue.arrayUnion([form.studioId]),
      "forms": FieldValue.arrayUnion([form.formId])
    });
  }
}
