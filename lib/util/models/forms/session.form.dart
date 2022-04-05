part of 'form.dart';

class SessionForm {
  Artist artist;
  String description;
  String bodylocation;
  String clientnotes;
  SessionForm(
      this.artist, this.description, this.bodylocation, this.clientnotes);

  Map<String, dynamic> toJSON() => {
        "artist": artist,
        "description": description,
        "bodylocation": bodylocation,
        "clientnotes": clientnotes,
        "timestamp": FieldValue.serverTimestamp()
      };

  factory SessionForm.fromJSON(Map<String, dynamic> json) => new SessionForm(
      json['artist'],
      json['description'],
      json['bodylocation'],
      json['clientnotes']);

  factory SessionForm.instance() => new SessionForm(new Artist(""), "", "", "");
}
