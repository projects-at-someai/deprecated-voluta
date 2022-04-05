part of 'form.dart';

class ClientForm {
  String clientId;
  String address;
  String country;
  String phone;
  String zipcode;
  String city;
  String state;
  String firstName;
  String lastName;
  String gender;
  String pronoun;
  String emergencyName;
  String emergencyPhone;
  String dob;
  bool isCitizen;
  String idType;
  String idPathToFront;
  String idPathToBack;
  ClientForm(
      this.clientId,
      this.address,
      this.country,
      this.phone,
      this.zipcode,
      this.city,
      this.state,
      this.firstName,
      this.lastName,
      this.gender,
      this.pronoun,
      this.emergencyName,
      this.emergencyPhone,
      this.dob,
      this.isCitizen,
      this.idType);
  Map<String, dynamic> toJSON() => {
        "address": address,
        "country": country,
        "phone": phone,
        "zipcode": zipcode,
        "city": city,
        "state": state,
        "firstName": firstName,
        'lastName': lastName,
        "gender": gender,
        "pronoun": pronoun,
        "emergencyName": emergencyName,
        "emergencyPhone": emergencyPhone,
        "dob": dob,
        "isCitizen": isCitizen,
        "idType": idType,
      };

  factory ClientForm.fromJSON(Map<String, dynamic> json) => new ClientForm(
      json['clientId'],
      json['address'],
      json['country'],
      json['phone'],
      json['zipcode'],
      json['city'],
      json['state'],
      json['firstName'],
      json['lastName'],
      json['gender'],
      json['pronoun'],
      json['emergencyName'],
      json['emergencyPhone'],
      json['dob'],
      json['isCitizen'],
      json['idType']);

  factory ClientForm.create() => new ClientForm(Uuid().v1(), "", "", "", "", "",
      "", "", "", "", "", "", "", "", false, "");
}
