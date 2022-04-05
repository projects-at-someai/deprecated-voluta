import 'package:flutter/material.dart';

class PasscodePage extends StatefulWidget {
  PasscodePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  BoxDecoration get backgroundDecoration => BoxDecoration(
      gradient: LinearGradient(
          colors: [Theme.of(context).accentColor, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));
  final TextStyle descriptionStyle = TextStyle(
      color: Colors.white,
      height: 2,
      fontSize: 18,
      fontWeight: FontWeight.w500);
  List<int> code;
  @override
  void initState() {
    super.initState();
    code = [];
  }

  onClearPressed() {
    if (code.length != 0)
      setState(() {
        code.removeLast();
      });
  }

  onInputPressed(int number) {
    setState(() {
      if (code.length != 4) code.add(number);
    });
    if (code.length == 4) Navigator.of(context).pop(code.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(64),
            height: MediaQuery.of(context).size.height,
            decoration: backgroundDecoration,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildHeader(),
                  buildDescription(),
                  buildOutputRow(),
                  buildInputGrid(),
                  buildFooter()
                ])));
  }

  buildFooter() => Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildHelpButton(), buildSettingsButton()]));

  buildSettingsButton() => GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
                shape: BoxShape.rectangle),
            width: 80,
            height: 80,
            child: Icon(Icons.settings,
                color: Theme.of(context).primaryColor, size: 48)),
        onTap: () => print("Settings Button Pressed"),
      );

  buildHelpButton() => GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
                shape: BoxShape.rectangle),
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: Text("?",
                style: TextStyle(
                    fontSize: 48, color: Theme.of(context).primaryColor))),
        onTap: () => print("Questions Button Pressed"),
      );

  buildClearBox() => IconButton(
      onPressed: () => onClearPressed(),
      icon: Icon(Icons.chevron_left,
          color: Theme.of(context).primaryColor, size: 125));

  buildInputGrid() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6),
      child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 32,
          crossAxisSpacing: 32,
          children: [
            buildInputBox(1),
            buildInputBox(2),
            buildInputBox(3),
            buildInputBox(4),
            buildInputBox(5),
            buildInputBox(6),
            buildInputBox(7),
            buildInputBox(8),
            buildInputBox(9),
            Container(),
            buildInputBox(0),
            buildClearBox()
          ]),
    ));
  }

  buildInputBox(
    int number,
  ) =>
      GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text("$number",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 48))),
          onTap: () => onInputPressed(number));

  buildHeader() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildClose(),
            buildTitle(),
            Container(width: 0, height: 0)
          ],
        ),
      );

  buildOutputRow() => Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildOutputBox(0),
        buildOutputBox(1),
        buildOutputBox(2),
        buildOutputBox(3)
      ]));

  buildOutputBox(int index) => Container(
      width: 125,
      height: 125,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).accentColor),
      child: code.length > index
          ? Text("*",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 64))
          : Container());
  buildDescription() => Padding(
        child: Text("Please enter your passcode to access this feature.",
            style: TextStyle(
                color: Colors.white,
                height: 2,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        padding: EdgeInsets.symmetric(vertical: 48),
      );

  buildTitle() => Text(
        "PASSCODE REQUIRED",
        style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      );
  buildClose() => IconButton(
      icon: Icon(
        Icons.close,
        size: 48,
      ),
      onPressed: () => print("Close Pressed"),
      color: Theme.of(context).primaryColor);
}
