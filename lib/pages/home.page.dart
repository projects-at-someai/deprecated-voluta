import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: Palette.background,
      child: Column(
        children: [
          Container(
              child: Row(
            children: [
              Align(
                child: VolutaButtons.logoSmall(context),
                alignment: Alignment.centerLeft,
              ),
            ],
          )),
          Expanded(child: Container()),
          Align(
            child: VolutaText.display("WELCOME TO YOUR SESSION"),
            alignment: Alignment.center,
          ),
          Padding(
              child: VolutaText.body1(
                  "This app is Voluta Digital's Tattoo Release Form. It will generate a secure, paperless, tree-loving waiver for each tattoo session.",
                  center: true),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 6)),
          Expanded(child: Container()),
          VolutaButtons.text(
              context, onAboutButtonPressed, "CLICK HERE FOR MORE INFORMATION"),
          Expanded(child: Container()),
          VolutaButtons.primaryWithSubtitle(context, onNewClientButtonPressed,
              "NEW CLIENT", "Click here if you're new to our studio"),
          Container(height: 16),
          VolutaButtons.secondaryWithSubtitle(
              context,
              () => print("return client"),
              "RETURN CLIENT",
              "Click here for return client or \"Saved for Later\" realse form. Passcode required."),
          Expanded(child: Container()),
          Container(
              child: Row(
            children: [
              VolutaButtons.icon(context, onHelpButtonPressed,
                  Icon(Icons.info_outline, color: Palette.gold60, size: 24)),
              VolutaButtons.icon(
                  context,
                  () => Navigator.of(context).pushNamed("/settings"),
                  Icon(Icons.settings_outlined,
                      color: Palette.gold60, size: 24))
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      padding: EdgeInsets.all(32),
    ));
  }

  buildTitle() => Align(
      alignment: Alignment(0, -0.6),
      child: Container(
          child: Text("WELCOME TO YOUR SESSION",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  wordSpacing: 2,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1)),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6)));

  onAboutButtonPressed() => Navigator.of(context).pushNamed("/about");


  onHelpButtonPressed() => Navigator.of(context).pushNamed("/help");

  onNewClientButtonPressed() => Navigator.of(context).pushNamed("/new-client");

  onReturnClientButtonPressed() =>
      Navigator.of(context).pushNamed("/return-client");
}
