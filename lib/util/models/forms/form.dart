import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:voluta_digital_trf/util/models/client.dart';
import 'package:voluta_digital_trf/util/models/items/item.dart';
import 'package:voluta_digital_trf/util/models/studio.dart';
part 'client.form.dart';
part 'health.form.dart';
part 'legal.form.dart';
part 'session.form.dart';
part 'social.form.dart';

class VolutaForm {
  String formId;
  String studioId;
  ClientForm client;
  SessionForm session;
  SocialForm social;
  HealthForm health;
  LegalForm legal;

  Map<String, dynamic> toJSON() => {
        "formId": formId,
        "studioId": studioId,
        "client": client.toJSON(),
        "session": session.toJSON(),
        "social": social.toJSON(),
        "health": health.toJSON(),
        "legal": legal.toJSON(),
        "_timestamp": FieldValue.serverTimestamp(),
        "_tags": [formId, studioId, "${client.firstName} ${client.lastName}"]
      };

  VolutaForm(this.formId, this.studioId, this.client, this.session, this.social,
      this.health, this.legal);

  factory VolutaForm.fromJSON(Map<String, dynamic> json) => new VolutaForm(
      json['formId'],
      json['studioId'],
      ClientForm.fromJSON(json['client'] as Map<String, dynamic>),
      SessionForm.fromJSON(json['session'] as Map<String, dynamic>),
      SocialForm.fromJSON(json['social'] as Map<String, dynamic>),
      HealthForm.fromJSON(json['health'] as Map<String, dynamic>),
      LegalForm.fromJSON(json['legal'] as Map<String, dynamic>));

  factory VolutaForm.fromClient(VolutaStudio studio, VolutaClient client) =>
      new VolutaForm(
          Uuid().v1(),
          studio.id,
          client.client,
          SessionForm.instance(),
          client.social,
          client.health,
          LegalForm.instance());
}
