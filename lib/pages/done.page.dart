import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  DonePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  BoxDecoration get backgroundDecoration => BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.black87, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));
  LinearGradient get gradient => LinearGradient(
      colors: [Colors.black87, Colors.black],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: backgroundDecoration,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5,
                vertical: MediaQuery.of(context).size.height / 4),
            child: Column(children: [
              buildIcon(),
              buildHeader(),
              buildInstructions(),
              buildStartButton(),
            ])));
  }

  Widget buildStartButton() => Expanded(
          child: Center(
              child: GestureDetector(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2))),
            child: Text(
              "TAP TO START",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )),
      )));

  Widget buildInstructions() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "PLEASE TELL STUDIO STAFF TO TAKE OVER FROM HERE.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 32,
            wordSpacing: 1.2),
      ));

  Widget buildIcon() => Container(
        width: 150,
        height: 150,
        child: Icon(Icons.check, color: Colors.white, size: 75),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(75)),
      );

  Widget buildHeader() => Padding(
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Text("NICELY DONE",
          style: TextStyle(color: Colors.white, fontSize: 18)));
}
