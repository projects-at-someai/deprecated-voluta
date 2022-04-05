import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/util/services/auth.service.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    AuthService.stream(onAuthChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: Palette.background,
            child: Stack(children: [
              buildHeader(),
              if (AuthService.isSignedIn()) buildStartButton(),
              if (!AuthService.isSignedIn()) buildNewStudioButton(),
              if (!AuthService.isSignedIn()) buildExistingStudioButton(),
              buildSubheader(),
              buildLogo()
            ])));
  }

  onAuthChange(user) {
    print(user);
  }

  Widget buildNewStudioButton() => Align(
      alignment: Alignment(0, 0.75),
      child: VolutaButtons.primaryWithSubtitle(
          context,
          onNewStudioButtonPressed,
          "Create Account",
          "Click here if you're new to the app!"));
  Widget buildExistingStudioButton() => Align(
      alignment: Alignment(0, 0.75),
      child: VolutaButtons.secondaryWithSubtitle(
          context,
          onExistingStudioButtonPressed,
          "Sign In",
          "Click here if you've been here before or are attaching a new device to your studio"));

  onNewStudioButtonPressed() => print("NEW STUDIO BUTTON PRESSED");
  
  onExistingStudioButtonPressed() => print("EXISTING STUDIO BUTTON PRESSED");

  Widget buildStartButton() => Align(
        child: VolutaButtons.text(context, onStartPressed, "TAP TO BEGIN"),
        alignment: Alignment(0, 0.75),
      );

  onStartPressed() async {
    if (AuthService.isSignedIn()) Navigator.of(context).pushNamed("/home");
  }

  Widget buildSubheader() => Align(
      alignment: Alignment(0, 0.1),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Text("APP FOR IPAD",
              style: TextStyle(color: Colors.white, fontSize: 18))));

  Widget buildPresentLabel() => Align(
      alignment: Alignment(0, -0.75),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Text("PRESENTS",
              style: TextStyle(color: Colors.white, fontSize: 18))));

  Widget buildHeader() => Align(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Text("TATTOO RELEASE FORMS",
              style: TextStyle(color: Colors.white, fontSize: 48))));

  buildSmallUserLogo() => Container(
      width: 150,
      height: 75,
      decoration: BoxDecoration(border: Border.all(color: Colors.white54)),
      alignment: Alignment.center,
      child: Text("Conan Logo Placeholder",
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).primaryColor)));

  buildCross() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Text("x",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w100, fontSize: 48)));
              
  buildBrandRow() => Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 96),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildSmallUserLogo(), buildCross(), buildBrand()])),
      );

  buildBrand() => Container(
      width: 150,
      height: 75,
      decoration: BoxDecoration(border: Border.all(color: Colors.white54)),
      alignment: Alignment.center,
      child: Text("Voluta Digital Placeholder",
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).primaryColor)));

  buildLogo() => Align(
      alignment: Alignment(0, -0.25),
      child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png")))));

  onSettingsButtonPressed() {
    //
  }

  onBeginPressed() {}
}
