import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:voluta_digital_trf/util/models/items/item.dart';

class VolutaStudio {
  String id;
  String name;
  List<Artist> artists;
  String logo;
  String legalName;
  String street;
  String city;
  String state;
  String zipcode;
  String phone;
  String email;
  String website;
  String healthCodes;
  String masterPasscode;
  String artistPasscode;
  String password;
  List<String> devices;
  int remainingForms;
  List<HealthQuestion> healthQuestions;
  List<LegalClause> legalClauses;
  List<TattooInk> inks;
  List<InkThinner> inkThinners;
  List<Needle> needles;
  List<DisposableTube> disposableTubes;
  List<DisposableGrip> disposableGrips;
  List<Salve> salves;
  String access;

  bool isInitialPopupActive;
  String initialPopupText;
  bool isOptionalClientNotesActive;
  bool isClientEmailRequired;
  bool isSecondIdRequired;
  bool isCapturePictureActive;
  bool isAutomaticEmailerActive;
  bool isEmailPDFToClientActive;
  String clientPDFEmailSubject;
  String clientPDFEmailBody;
  String clientPDF;
  bool isEmailWaiverToClientActive;
  String clientWaiverEmailSubject;
  String clientWaiverEmailBody;

  VolutaStudio(
    this.id,
    this.remainingForms,
    this.name,
    this.artists,
    this.logo,
    this.legalName,
    this.street,
    this.city,
    this.state,
    this.zipcode,
    this.phone,
    this.email,
    this.website,
    this.healthCodes,
    this.masterPasscode,
    this.artistPasscode,
    this.password,
    this.devices,
    this.healthQuestions,
    this.legalClauses,
    this.inks,
    this.inkThinners,
    this.needles,
    this.disposableTubes,
    this.disposableGrips,
    this.salves,
    this.access,
    this.isInitialPopupActive,
    this.initialPopupText,
    this.isOptionalClientNotesActive,
    this.isClientEmailRequired,
    this.isSecondIdRequired,
    this.isCapturePictureActive,
    this.isAutomaticEmailerActive,
    this.isEmailPDFToClientActive,
    this.clientPDFEmailSubject,
    this.clientPDFEmailBody,
    this.clientPDF,
    this.isEmailWaiverToClientActive,
    this.clientWaiverEmailSubject,
    this.clientWaiverEmailBody,
  );

  Map<String, dynamic> toJSON() => {
        'id': id,
        'name': name,
        'artists': artists.map((a) => a.toString()).toList(),
        'logo': logo,
        'legalName': legalName,
        'street': street,
        'city': city,
        'state': state,
        'zipcode': zipcode,
        'phone': phone,
        'email': email,
        'website': healthCodes,
        'masterPasscode': masterPasscode,
        'artistPasscode': artistPasscode,
        'password': password,
        'devices': [],
        'remainingForms': remainingForms,
        'healthQuestions': healthQuestions.map((a) => a.toString()).toList(),
        'legalClauses': legalClauses.map((l) => l.toString()).toList(),
        'inks': inks.map((i) => i.toString()).toList(),
        'inkThinners': inkThinners.map((i) => i.toString()).toList(),
        'needles': needles.map((i) => i.toString()).toList(),
        'disposableTubes': disposableTubes.map((i) => i.toString()).toList(),
        'disposableGrips': disposableGrips.map((i) => i.toString()).toList(),
        'salves': salves.map((i) => i.toString()).toList(),
        'access': access,
        'isInitialPopupActive': isInitialPopupActive,
        'initialPopupText': initialPopupText,
        'isOptionalClientNotesActive': isOptionalClientNotesActive,
        'isClientEmailRequired': isClientEmailRequired,
        'isSecondIdRequired': isSecondIdRequired,
        'isCapturePictureActive': isCapturePictureActive,
        'isAutomaticEmailerActive': isAutomaticEmailerActive,
        'isEmailPDFToClientActive': isEmailPDFToClientActive,
        'clientPDFEmailSubject': clientPDFEmailSubject,
        'clientPDFEmailBody': clientPDFEmailBody,
        'clientPDF': clientPDF,
        'isEmailWaiverToClientActive': isEmailWaiverToClientActive,
        'clientWaiverEmailSubject': clientWaiverEmailSubject,
        'clientWaiverEmailBody': clientWaiverEmailBody,
      };

  save() async {
    FirebaseFirestore.instance.collection("studio").doc(id).set(this.toJSON());
  }

  factory VolutaStudio.fromJSON(Map<String, dynamic> json) => new VolutaStudio(
      json['id'],
      json['remainingForms'] as int,
      json['name'],
      (json['artists'] as List<Map<String, dynamic>>)
          .map((child) => Artist.fromJSON(child))
          .toList(),
      json['logo'],
      json['legalName'],
      json['street'],
      json['city'],
      json['state'],
      json['zipcode'],
      json['phone'],
      json['email'],
      json['website'],
      json['healthCodes'],
      json['masterPasscode'],
      json['artistPasscode'],
      json['password'],
      json['devices'] as List<String>,
      (json['healthQuestions'] as List<String>)
          .map((child) => HealthQuestion.fromString(child))
          .toList(),
      (json['legalClauses'] as List<String>)
          .map((child) => LegalClause.fromString(child))
          .toList(),
      (json['inks'] as List<String>)
          .map((child) => TattooInk.fromString(child))
          .toList(),
      (json['inkThinners'] as List<String>)
          .map((child) => InkThinner.fromString(child))
          .toList(),
      (json['needles'] as List<String>)
          .map((child) => Needle.fromString(child))
          .toList(),
      (json['disposableTubes'] as List<String>)
          .map((child) => DisposableTube.fromString(child))
          .toList(),
      (json['disposableGrips'] as List<String>)
          .map((child) => DisposableGrip.fromString(child))
          .toList(),
      (json['salves'] as List<String>)
          .map((child) => Salve.fromString(child))
          .toList(),
      json['access'],
      json['isInitialPopupActive'],
      json['initialPopupText'],
      json['isOptionalClientNotesActive'],
      json['isClientEmailRequired'],
      json['isSecondIdRequired'],
      json['isCapturePictureActive'],
      json['isAutomaticEmailerActive'],
      json['isEmailPDFToClientActive'],
      json['clientPDFEmailSubject'],
      json['clientPDFEmailBody'],
      json['clientPDF'],
      json['isEmailWaiverToClientActive'],
      json['clientWaiverEmailSubject'],
      json['clientWaiverEmailBody']);

  factory VolutaStudio.instance() => new VolutaStudio(
      Uuid().v1(),
      15,
      '',
      [],
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      "normal",
      false,
      "",
      true,
      false,
      false,
      true,
      false,
      false,
      "",
      "",
      "",
      false,
      "",
      '');
}
