import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/util/models/client.dart';
import 'package:voluta_digital_trf/util/models/forms/form.dart';
import 'package:voluta_digital_trf/util/models/items/item.dart';
import 'package:voluta_digital_trf/util/models/studio.dart';
import 'package:voluta_digital_trf/widgets/forms.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class CustomerPage extends StatefulWidget {
  final VolutaClient client;
  CustomerPage({this.client});
  @override
  _CustomerPageState createState() => new _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  VolutaForm form;
  VolutaClient client;
  VolutaStudio studio;
  final List<String> pronouns = [
    "He/Him/His",
    "She/Her/Hers",
    "They/Them/Theirs",
    "Not Listed"
  ];

  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    studio = VolutaStudio.instance();
    client = widget.client ?? VolutaClient.create(studio);
    form = VolutaForm.fromClient(studio, client);
  }

  buildTabs() {
    return Container(
        child: Column(children: [
      Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Theme.of(context).accentColor))),
          child: ListTile(
            title: Text("ID CAPTURE",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
          )),
      Container(
          child: ListTile(
        title: Text("BIO"),
      )),
      Container(
          child: ListTile(
        title: Text("STUDIO"),
      )),
      Container(
          child: ListTile(
        title: Text("HEALTH"),
      )),
      Container(
          child: ListTile(
        title: Text("LEGAL"),
      ))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: Palette.background,
            child: buildColumns()));
  }

  buildMenu() => Container(
      decoration: Palette.drawer,
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      child: Column(children: [
        buildSmallLogo(),
        buildTabs(),
      ]));
  buildColumns() => Row(
        children: [
          Expanded(flex: 1, child: buildMenu()),
          Expanded(flex: 3, child: buildForm())
        ],
      );

  buildSmallLogo() => Container(
      width: 150,
      height: 75,
      decoration: BoxDecoration(border: Border.all(color: Colors.white54)),
      alignment: Alignment.center,
      child: Text("Conan Logo Placeholder",
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).primaryColor)));

  buildForm() => Padding(
        child: Column(
          children: [
            buildHeader(),
            Expanded(
                child: Container(
                    // color: Colors.red,
                    child: ListView(
                        children: [
              buildStepIndicator(),
            ]..addAll(getForm()))))
          ],
        ),
        padding: EdgeInsets.only(top: 24, left: 24, right: 24),
      );

  buildHeader() => Container(
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [buildBackButton(), buildNextButton()]));

  buildBackButton() => Expanded(
      child: ListTile(
          onTap: () => setState(() => currentStep -= 1),
          subtitle: Text(getPreviousStepLabel(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 32)),
          title: Text("PREVIOUS",
              textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
          leading: Icon(Icons.arrow_back,
              color: Theme.of(context).primaryColor, size: 32)));

  buildNextButton() => Expanded(
      child: ListTile(
          onTap: () => setState(() => currentStep += 1),
          subtitle: Text(getNextStepLabel(),
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: true
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).accentColor,
                  fontSize: 32)),
          title: Text("NEXT",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: true ? Colors.white : Theme.of(context).accentColor)),
          trailing: Icon(Icons.arrow_forward,
              color: true
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              size: 32)));

  /// SOCIAL FORM
  List<Widget> buildSocialForm() => [
        VolutaText.h1("WE'D LOVE TO CONNECT WITH YOU!"),
        VolutaText.body1(
            "Please tell us how you found us and please opt-in for our email newsletters. We promise to never share your social information.",
            height: 1.5),
        Container(height: 24),
        VolutaText.h3("REFERRAL"),
        buildReferralGrid(),
        VolutaForms.getToggle("EMAIL OPT-IN", hasOptIn, onOptInChanged),
      ];

  String referral = "";
  onReferralChanged(String value) {
    setState(() {
      this.referral = value;
    });
  }

  String email = "";
  onEmailChanged(String value) {
    setState(() {
      this.email = value;
    });
  }

  bool hasOptIn = false;
  onOptInChanged(bool b) {
    setState(() {
      hasOptIn = b;
    });
  }

  // SESSION FORM
  List<Widget> buildStudioSessionForm() => [
        VolutaText.h1("DETAILS ABOUT TODAY'S SESSION"),
        VolutaText.h2(today, color: Palette.white),
        Container(height: 24),
        VolutaText.h3("ARTIST NAME"),
        VolutaForms.getTextField(artist, onArtistChanged),
        VolutaText.h3("TATTOO DESCRIPTION"),
        VolutaForms.getTextField(description, onDescriptionChanged, lines: 3),
        VolutaText.h3("BODY LOCATION"),
        VolutaForms.getTextField(bodylocation, onBodyLocationChanged),
        VolutaText.h3("CLIENT NOTES"),
        VolutaForms.getTextField(clientnotes, onClientNotesChanged, lines: 3),
      ];

  String artist = "";
  onArtistChanged(String value) {
    setState(() {
      this.artist = value;
    });
  }

  String description = "";
  onDescriptionChanged(String value) {
    setState(() {
      this.description = value;
    });
  }

  String bodylocation = "";
  onBodyLocationChanged(String value) {
    setState(() {
      this.bodylocation = value;
    });
  }

  String clientnotes = "";
  onClientNotesChanged(String value) {
    setState(() {
      this.clientnotes = value;
    });
  }

  List<Widget> buildClientInfoForm() => [
        VolutaText.h1("PLEASE TELL US ABOUT YOU"),
        VolutaText.h3("FIRST NAME"),
        VolutaForms.getTextField(firstName, onFirstNameChanged,
            hint: "Enter your first name"),
        VolutaText.h3("LAST NAME"),
        VolutaForms.getTextField(lastName, onLastNameChanged,
            hint: "Enter your last name"),
        VolutaText.h3("GENDER"),
        buildGenderGrid(),
        VolutaText.h3("YOUR PRONOUNS"),
        buildPronounGrid(),
        VolutaText.h3("DATE OF BIRTH"),
        buildDateOfBirth(),
        VolutaForms.getToggle(
            "ARE YOU A U.S CITIZEN?", isCitizen, onCitizenChanged),
        if (!isCitizen) VolutaText.h3("COUNTRY"),
        if (!isCitizen)
          VolutaForms.getTextField(country, onCountryChanged,
              hint: "Enter your country"),
        VolutaText.h3("ADDRESS"),
        VolutaForms.getTextField(address, onAddressChanged,
            hint: "Enter your address"),
        VolutaText.h3("POST TOWN OR CITY"),
        VolutaForms.getTextField(city, onCityChanged,
            hint: "Enter your post town or city"),
        VolutaText.h3("LOCALITY, PROVINCE OR STATE"),
        VolutaForms.getTextField(state, onStateChanged,
            hint: "Enter your locality, province or state"),
        VolutaText.h3("POSTAL CODE OR ZIP CODE"),
        VolutaForms.getTextField(zipcode, onZipcodeChanged,
            hint: "Enter your postal or zip code"),
        VolutaText.h3("PHONE NUMBER"),
        VolutaForms.getTextField(phone, onPhoneChanged,
            hint: "Enter your phone number"),
        VolutaText.h3("ID TYPE"),
        buildIDGrid(),
        VolutaText.h1("EMERGENCY CONTACT"),
        VolutaText.body1(
            "We care about you. We collect this info only for your own safety measurement.",
            height: 1.5),
        Container(height: 16),
        VolutaText.h3("NAME"),
        VolutaForms.getTextField(emergencyName, onEmergencyNameChanged,
            hint: "Enter your emergency contact name"),
        VolutaText.h3("PHONE NUMBER"),
        VolutaForms.getTextField(emergencyPhone, onEmergencyPhoneChanged,
            hint: "Enter your emergency contact phone number"),
      ];

  String today = DateFormat.yMMMMd('en_US').format(DateTime.now());

  String address = "";
  onAddressChanged(String value) {
    setState(() {
      this.address = value;
    });
  }

  String country = "";
  onCountryChanged(String value) {
    setState(() {
      this.country = value;
    });
  }

  String phone = "";
  onPhoneChanged(String value) {
    setState(() {
      this.phone = value;
    });
  }

  String zipcode = "";
  onZipcodeChanged(String value) {
    setState(() {
      this.zipcode = value;
    });
  }

  String state = "";
  onStateChanged(String value) {
    setState(() {
      this.state = value;
    });
  }

  String city = "";
  onCityChanged(String value) {
    setState(() {
      this.city = value;
    });
  }

  String firstName = "";
  onFirstNameChanged(String value) {
    setState(() {
      this.firstName = value;
    });
  }

  String lastName = "";
  onLastNameChanged(String value) {
    setState(() {
      this.lastName = value;
    });
  }

  String gender = "";
  onGenderChanged(String value) {
    setState(() {
      this.gender = value;
    });
  }

  String pronoun = "";
  onPronounsChanged(String value) {
    setState(() {
      this.pronoun = value;
    });
  }

  String dob = "";
  onDateOfBirthChanged(String value) {
    setState(() {
      this.dob = value;
    });
  }

  String emergencyName = "";
  onEmergencyNameChanged(String value) {
    setState(() {
      this.emergencyName = value;
    });
  }

  String emergencyPhone = "";
  onEmergencyPhoneChanged(String value) {
    setState(() {
      this.emergencyPhone = value;
    });
  }

  bool isCitizen = false;
  onCitizenChanged(bool value) {
    setState(() {
      this.isCitizen = value;
    });
  }

  String idType = "";
  onIDTypeChanged(String value) {
    setState(() {
      this.idType = value;
    });
  }

  List<Widget> buildHealthForm() {
    return [
      VolutaText.h1("Health"),
      VolutaText.body1(
          "We ask these questions only to assure a safe and healthy session for all. We respect your privacy and will protect your health information."),
      Center(child: VolutaText.h2("ALLERGIES")),
    ]
      ..addAll(form.health.responses
          .where((response) => response.question.section == "Allergies")
          .map((response) => mapHealthResponseToWidget(response))
          .toList())
      ..add(
        Center(child: VolutaText.h2("DISEASES")),
      )
      ..addAll(form.health.responses
          .where((response) => response.question.section == "Diseases")
          .map((response) => mapHealthResponseToWidget(response))
          .toList());
  }

  Widget mapHealthResponseToWidget(HealthResponse response) {
    switch (response.question.type) {
      case ("Yes/No"):
        return VolutaForms.getSwitch(
            response.question.label,
            response.response == 'Yes',
            (bool value) =>
                setState(() => response.response = (value ? 'Yes' : 'No')));
      case ("TextField"):
        return VolutaForms.getTextField(
            response.response, (value) => response.response = value,
            label: response.question.label);
      case ('Yes/No & Textfield'):
        return VolutaText.body1("TODO: YES/NO");
      default:
        return Container();
    }
  }

  List<Widget> buildLegalForm() {
    return [Container()];
  }

  num currentStep = 2;

  String getNextStepLabel() {
    switch (currentStep) {
      case (1):
        return "BIO";
      case (2):
        return "STUDIO";
      case (3):
        return "SOCIAL";
      case (4):
        return "HEALTH";
      case (5):
        return "LEGAL";
      default:
        return "SUBMIT";
    }
  }

  String getPreviousStepLabel() {
    switch (currentStep) {
      case (1):
        return "CANCEL";
      case (2):
        return "ID CAPTURE";
      case (3):
        return "BIO";
      case (4):
        return "STUDIO";
      case (5):
        return "SOCIAL";
      default:
        return "HEALTH";
    }
  }

  List<Widget> getForm() {
    switch (currentStep) {
      case (1):
        return [Container()];
      case (2):
        return buildClientInfoForm();
      case (3):
        return buildStudioSessionForm();
      case (4):
        return buildSocialForm();
      case (5):
        return buildHealthForm();
      default:
        return buildLegalForm();
    }
  }

  buildStepIndicator() => Container(
      child: VolutaText.h1("STEP $currentStep OF 6", color: Colors.white),
      padding: EdgeInsets.only(
        top: 8,
      ));

  buildGenderGrid() => Container(
      margin: EdgeInsets.only(top: 8),
      height: 180,
      alignment: Alignment.center,
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 32,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 32,
          children: [
            buildOption(gender, "Female", onGenderChanged),
            buildOption(gender, "Male", onGenderChanged),
            buildOption(gender, "Non-Conforming", onGenderChanged),
            buildOption(gender, "Other", onGenderChanged),
          ]));

  buildReferralGrid() => Container(
      margin: EdgeInsets.only(top: 8),
      height: 180,
      alignment: Alignment.center,
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 32,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 32,
          children: [
            buildOption(referral, "Facebook", onReferralChanged),
            buildOption(referral, "Instagram", onReferralChanged),
            buildOption(referral, "Twitter", onReferralChanged),
            buildOption(referral, "Google", onReferralChanged),
          ]));

  buildPronounGrid() => Container(
      margin: EdgeInsets.only(top: 8),
      height: 180,
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 32,
          mainAxisSpacing: 32,
          children: [
            buildOption(pronoun, pronouns[0], onPronounsChanged),
            buildOption(pronoun, pronouns[1], onPronounsChanged),
            buildOption(pronoun, pronouns[2], onPronounsChanged),
            buildOption(pronoun, pronouns[3], onPronounsChanged),
          ]));

  buildIDGrid() => Container(
      height: 180,
      margin: EdgeInsets.only(top: 8),
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 32,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 32,
          children: [
            buildOption(idType, "Driver's License", onIDTypeChanged),
            buildOption(idType, "Passport", onIDTypeChanged),
            buildOption(idType, "State ID Card", onIDTypeChanged),
            buildOption(idType, "Gov't ID Card", onIDTypeChanged),
          ]));

  buildOption(String current, String value, Function(String) onTapped) =>
      GestureDetector(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: current == value
                      ? Border.all(
                          color: Theme.of(context).primaryColor, width: 2)
                      : Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: current == value
                          ? Icon(Icons.check, size: 24, color: Colors.white)
                          : null,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: current == value
                              ? Theme.of(context).primaryColor
                              : Colors.black26),
                    ),
                    Container(width: 8),
                    Container(
                      alignment: Alignment.center,
                      child: VolutaText.body1(value,
                          height: 1, color: Theme.of(context).primaryColor),
                    ),
                    Expanded(child: Container())
                  ])),
          onTap: () => onTapped(value));

  buildDateOfBirth() => Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        keyboardType: TextInputType.datetime,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.white54),
            hintText: "E.g dd/mm/yyyy",
            fillColor: Theme.of(context).accentColor),
      ));
}
