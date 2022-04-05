part of 'form.dart';

class SocialForm {
  String email;
  String referral;
  bool hasOptIn;
  SocialForm(this.email, this.referral, this.hasOptIn);
  Map<String, dynamic> toJSON() =>
      {"email": email, "referral": referral, "hasOptIn": hasOptIn};

  factory SocialForm.fromJSON(Map<String, dynamic> json) =>
      new SocialForm(json['email'], json['referral'], json['hasOptIn']);

  factory SocialForm.instance() => new SocialForm("", "", false);
}
