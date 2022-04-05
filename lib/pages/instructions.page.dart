import 'package:flutter/material.dart';

class InstructionsPage extends StatefulWidget {
  InstructionsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
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
  @override
  void initState() {
    super.initState();
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
                  buildInputGrid(),
                ])));
  }

  buildInputGrid() {
    return Expanded(
      child: GridView.count(crossAxisCount: 2, children: [
        buildStepOne(),
        buildStepTwo(),
        buildStepThree(),
        buildStepFour()
      ]),
    );
  }

  buildStepOne() => Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Theme.of(context).accentColor),
                bottom: BorderSide(color: Theme.of(context).accentColor))),
        child: Stack(
          children: [
            buildStepIcon(1),
            buildStepOneImage(),
            buildStepOneInstructions()
          ],
        ),
      );
  buildStepOneInstructions() => Align(
      alignment: Alignment(0, 0.75),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Tap",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 24)),
        TextSpan(
            text: " TRF Settings\n",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))
      ])));
  buildStepTwoInstructions() => Align(
      alignment: Alignment(0, 0.75),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Enter the default passcode\n",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 24)),
            TextSpan(
                text: "1234",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ])));
  buildStepThreeInfo() => Align(
      alignment: Alignment(0, -0.5),
      child: Container(
          height: 210,
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                  leading: Icon(Icons.check,
                      color: Theme.of(context).primaryColor, size: 36),
                  title: Text("Studio Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ))),
              ListTile(
                  leading: Icon(Icons.check,
                      color: Theme.of(context).primaryColor, size: 36),
                  title: Text("One Artist Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ))),
              ListTile(
                  leading: Icon(Icons.check,
                      color: Theme.of(context).primaryColor, size: 36),
                  title: Text("Enable One Cloud Service",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )))
            ],
          )));
  buildStepThreeInstructions() => Align(
      alignment: Alignment(0, 0.75),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Provide above ",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 24)),
            TextSpan(
                text: "information",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ])));

  buildStepFourInstructions() => Align(
      alignment: Alignment(0, 0.75),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Tap ",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 24)),
            TextSpan(
                text: "\"Save and Verify\"",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold))
          ])));
  buildStepOneImage() => Align(
      alignment: Alignment(0, -0.5),
      child: Container(
          child: Text("Image Placeholder",
              style: TextStyle(color: Colors.white))));
  buildStepTwoImage() => Align(
      alignment: Alignment(0, -0.5),
      child: Container(
          child: Text("Image Placeholder",
              style: TextStyle(color: Colors.white))));
  buildStepFourImage() => Align(
      alignment: Alignment(0, -0.5),
      child: Container(
          child: Text("Image Placeholder",
              style: TextStyle(color: Colors.white))));
  buildStepIcon(int number) => Align(
      alignment: Alignment(0, 0.3),
      child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(40)),
          alignment: Alignment.center,
          child: Text("$number",
              style: TextStyle(color: Colors.white, fontSize: 36))));
  buildStepTwo() => Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).accentColor))),
        child: Stack(
          children: [
            buildStepIcon(2),
            buildStepTwoImage(),
            buildStepTwoInstructions()
          ],
        ),
      );
  buildStepThree() => Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Theme.of(context).accentColor))),
        child: Stack(
          children: [
            buildStepIcon(3),
            buildStepThreeInfo(),
            buildStepThreeInstructions()
          ],
        ),
      );
  buildStepFour() => Container(
        child: Stack(
          children: [
            buildStepIcon(4),
            buildStepFourImage(),
            buildStepFourInstructions()
          ],
        ),
      );

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

  buildDescription() => Padding(
        child: Text(
            "In order to get started, TRF requires some basic information. You can change or add more at any time. ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                height: 2,
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 64),
      );

  buildTitle() => Text(
        "INITIAL SETUP INSTRUCTIONS",
        style: TextStyle(
            fontSize: 42,
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
