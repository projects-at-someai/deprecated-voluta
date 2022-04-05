import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/util/models/items/item.dart';
import 'package:voluta_digital_trf/util/models/studio.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/card.dart';
import 'package:voluta_digital_trf/widgets/dialog.dart';
import 'package:voluta_digital_trf/widgets/forms.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  ScrollController _scroll;
  VolutaStudio studio;

  @override
  void initState() {
    super.initState();
    _scroll = new ScrollController();
    studio = VolutaStudio.instance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 150,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 32,
              ),
              onPressed: () => Navigator.of(context).pop(),
              color: Palette.gold60),
          title: VolutaText.display("TATTOO RELEASE FORM SETTINGS"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: buildStudioForm(),
      ),
      decoration: Palette.background,
    );
  }

  buildStudioForm() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: buildMenu(),
                    ))),
            Container(width: 32),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    VolutaForms.getTextField(studio.name, onNameChanged,
                        hint: "Enter your studio's legal name",
                        label: "STUDIO NAME"),
                    VolutaText.h3("ARTISTS LIST"),
                    VolutaCards.getBasicCard(
                        "${studio.artists.length} artist(s) listed",
                        () => Artist.dialog(context, studio.artists).then(
                            (result) =>
                                setState(() => studio.artists = result))),
                    VolutaText.h1("STUDIO VITAL INFORMATION",
                        color: Colors.white),
                    VolutaForms.getTextField(studio.name, onNameChanged,
                        hint: "Enter your studio's legal name",
                        label: "LEGAL NAME"),
                    VolutaForms.getTextField(
                        studio.street, onStreetAddressChanged,
                        label: "STREET ADDRESS", hint: "123 meridian street"),
                    VolutaForms.getFormRow([
                      VolutaForms.getTextField(studio.city, onCityChanged,
                          hint: "Indianapolis", label: "CITY"),
                      VolutaForms.getTextField(studio.state, onStateChanged,
                          hint: "IN", label: "STATE"),
                      VolutaForms.getTextField(studio.zipcode, onZipChanged,
                          hint: "46062", label: "ZIP CODE")
                    ]),
                    VolutaForms.getEmailField(studio.email, onEmailChanged,
                        label: "STUDIO EMAIL", hint: "jack@volutadigital.com"),
                    VolutaForms.getTextField(studio.phone, onPhoneChanged,
                        label: "STUDIO PHONE NUMBER", hint: "(847) 777-7777"),
                    VolutaForms.getTextField(studio.website, onWebsiteChanged,
                        label: "STUDIO WEBSITE", hint: "www.voluta.com"),
                    VolutaForms.getTextField(
                        studio.healthCodes, onHealthCodesChanged,
                        label: "HEALTH CODES", hint: "", lines: 2),
                    Container(height: 24),
                    VolutaText.h1("PASSCODES", color: Colors.white),
                    VolutaCards.getBasicCard(
                        "Master Passcode", () => print("TODO")),
                    VolutaCards.getBasicCard(
                        "Artist Passcode", () => print("TODO")),
                    Container(height: 24),
                    VolutaText.h1("CLIENT FORMS", color: Colors.white),
                    VolutaText.h2("FORM TOGGLES"),
                    VolutaForms.getToggle(
                        'Initial Popup',
                        studio.isInitialPopupActive,
                        (value) => setState(() => studio.isInitialPopupActive =
                            !studio.isInitialPopupActive)),
                    VolutaForms.getToggle(
                        'Show Optional Client Notes',
                        studio.isOptionalClientNotesActive,
                        (value) => setState(() =>
                            studio.isOptionalClientNotesActive =
                                !studio.isOptionalClientNotesActive)),
                    VolutaForms.getToggle(
                        'Require Client Email',
                        studio.isClientEmailRequired,
                        (value) => setState(() => studio.isClientEmailRequired =
                            !studio.isClientEmailRequired)),
                    VolutaForms.getToggle(
                        'Require Second Picture of Gov\'t ID',
                        studio.isSecondIdRequired,
                        (value) => setState(() => studio.isSecondIdRequired =
                            !studio.isSecondIdRequired)),
                    VolutaForms.getToggle(
                        'Capture Picture of ID',
                        studio.isCapturePictureActive,
                        (value) => setState(() =>
                            studio.isCapturePictureActive =
                                !studio.isCapturePictureActive)),
                    VolutaText.h2("EDITORS"),
                    VolutaCards.getBasicCard(
                        "${studio.healthQuestions.length} Health Question(s)",
                        () => HealthQuestion.dialog(
                                context, studio.healthQuestions)
                            .then((result) => setState(
                                () => studio.healthQuestions = result))),
                    VolutaCards.getBasicCard(
                        "${studio.legalClauses.length} Legal Clause(s)",
                        () => LegalClause.dialog(context, studio.legalClauses)
                            .then((result) =>
                                setState(() => studio.legalClauses = result))),
                    VolutaCards.getBasicCard(
                        "${studio.inks.length} Unique Ink(s)",
                        () => TattooInk.dialog(context, studio.inks).then(
                            (result) => setState(() => studio.inks = result))),
                    VolutaCards.getBasicCard(
                        "${studio.inkThinners.length} Ink Thinner(s) ",
                        () => InkThinner.dialog(context, studio.inkThinners)
                            .then((result) =>
                                setState(() => studio.inkThinners = result))),
                    VolutaCards.getBasicCard(
                        "${studio.needles.length} Needle(s) ",
                        () => Needle.dialog(context, studio.needles).then(
                            (result) =>
                                setState(() => studio.needles = result))),
                    VolutaCards.getBasicCard(
                        "${studio.disposableTubes.length} Disposable Tube(s)",
                        () => DisposableTube.dialog(
                                context, studio.disposableTubes)
                            .then((result) => setState(
                                () => studio.disposableTubes = result))),
                    VolutaCards.getBasicCard(
                        "${studio.disposableGrips.length} Disposable Grip(s) ",
                        () => DisposableGrip.dialog(
                                context, studio.disposableGrips)
                            .then((result) => setState(
                                () => studio.disposableGrips = result))),
                    VolutaCards.getBasicCard(
                        "${studio.salves.length} Salve(s)",
                        () => Salve.dialog(context, studio.salves).then(
                            (result) =>
                                setState(() => studio.salves = result))),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                )))
          ],
        ));
  }

  onEditMasterCodePressed() async {
    Navigator.of(context).pushNamed("/passcode").then((result) {
      print(result);
      if (result != null && (result as String).length == 4)
        onMasterCodeChanged(result);
    });
  }

  onEditArtistCodePressed() {
    Navigator.of(context).pushNamed("/passcode").then((result) {
      if (result != null && (result as String).length == 4)
        onArtistCodeChanged(result);
    });
  }

  onMasterCodeChanged(String value) {
    setState(() {
      studio.masterPasscode = value;
    });
  }

  onArtistCodeChanged(String value) {
    setState(() {
      studio.artistPasscode = value;
    });
  }

  onPhoneChanged(String value) {
    setState(() {
      studio.phone = value;
    });
  }

  onHealthCodesChanged(String value) {
    setState(() {
      studio.healthCodes = value;
    });
  }

  onEmailChanged(String value) {
    setState(() {
      studio.email = value;
    });
  }

  onWebsiteChanged(String website) {
    setState(() {
      studio.website = website;
    });
  }

  onNameChanged(String value) {
    setState(() {
      studio.name = value;
    });
  }

  onLegalNameChanged(String value) {
    setState(() {
      studio.legalName = value;
    });
  }

  onStreetAddressChanged(String value) {
    setState(() {
      studio.street = value;
    });
  }

  onCityChanged(String value) {
    setState(() {
      studio.city = value;
    });
  }

  onStateChanged(String value) {
    setState(() {
      studio.state = value;
    });
  }

  onZipChanged(String value) {
    setState(() {
      studio.zipcode = value;
    });
  }

  getEditorSection(String label, List<Widget> children) {
    return SliverStickyHeader(
        header: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: EdgeInsets.only(top: 8),
            alignment: Alignment.centerLeft,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(child: Row(children: [VolutaText.h1(label)])),
                ]))));
  }

  buildHealthForm() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 32, left: 32, right: 32),
        child: SingleChildScrollView(
            child: Column(
          children: [
            VolutaText.h1("allergies"),
            VolutaText.h1("DISEASES"),
            VolutaButtons.primary(
                context,
                null, //TODO: REPLACE
                VolutaText.h3("ADD NEW HEALTH QUESTION",
                    color: Palette.grey60)),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        )));
  }

  buildLegalForm() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 32, left: 32, right: 32),
        child: SingleChildScrollView(
            child: Column(
          children: [
            VolutaText.h1("CLAUSES"),
            VolutaButtons.primary(
                context,
                null, //TODO: REPLACE
                VolutaText.h3("ADD CLAUSE", color: Palette.grey60)),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        )));
  }

  List<Widget> buildMenu() => [
        VolutaText.h3("LOGO (DARK)"),
        buildDarkLogo(),
        buildEditDarkLogoButton(),
        VolutaText.h3("LOGO (LIGHT)"),
        buildLightLogo(),
        buildEditLightLogoButton(),
        Expanded(child: Container()),
        VolutaButtons.primary(context, () => studio.save(),
            VolutaText.h2("SAVE & VERIFY", color: Palette.grey80))
      ];
  buildLightLogo() => Padding(
      padding: EdgeInsets.only(top: 8),
      child: AspectRatio(
          aspectRatio: 1.66,
          child: Container(
              alignment: Alignment.center,
              child: VolutaText.h1("TODO", color: Palette.red40),
              decoration: BoxDecoration(
                  color: Palette.grey10,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2)))));
  buildEditDarkLogoButton() => TextButton(
      onPressed: () => print("On Edit Dark Logo Pressed"),
      child: VolutaText.h2("Tap to edit", color: Colors.white));

  buildEditLightLogoButton() => TextButton(
      onPressed: () => print("On Edit Light Logo Pressed"),
      child: VolutaText.h2("Tap to edit", color: Colors.white));

  buildDarkLogo() => Padding(
      padding: EdgeInsets.only(top: 8),
      child: AspectRatio(
          aspectRatio: 1.66,
          child: Container(
              alignment: Alignment.center,
              child: VolutaText.h1("TODO", color: Palette.red40),
              decoration: BoxDecoration(
                  color: Palette.grey80,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Palette.gold60, width: 2)))));
}
