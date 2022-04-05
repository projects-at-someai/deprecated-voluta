import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  @override
  _PreferencesPageState createState() => new _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  BoxDecoration get backgroundDecoration => BoxDecoration(
      gradient: LinearGradient(
          colors: [Theme.of(context).accentColor, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));

  //Define InkSection => INKS;INK_USED;INK_BATCH_NUMBERS;INK_THINNERS_USED;

  Map<String, dynamic> inks;

  Map<String, dynamic> disposables;

  initFields() {
    inks = {
      "label": "INKS",
      "attributes": ["INK USED", "INK BATCH NUMBERS", "INK THINNERS USED"],
      "settings": {
        "INK USED": [],
        "INK BATCH NUMBERS": [],
        "INK THINNERS USED": [],
      }
    };
    disposables = {
      "title": "DISPOSABLES",
      "attributes": [
        "NEEDLES USED",
        "NEEDLES BATCH NUMBERS",
        "DISPOSABLE TUBES USED",
        "DISPOSABLE TUBES LOT NUMBERS"
      ],
      "settings": {
        "NEEDLES USED": [],
        "NEEDLES BATCH NUMBERS": [],
        "DISPOSABLE TUBES USED": [],
        "DISPOSABLE TUBES LOT NUMBERS": []
      }
    };
  }

  @override
  void initState() {
    super.initState();
    initFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: backgroundDecoration,
            child: buildColumns()));
  }

  buildColumns() => Row(
        children: [
          Expanded(flex: 1, child: buildMenu()),
          Expanded(flex: 2, child: buildScrollView())
        ],
      );
  buildHeader() => Padding(
      padding: EdgeInsets.symmetric(vertical: 64),
      child: Text("TATTOO RELEASE FORMS SETTINGS",
          style:
              TextStyle(fontSize: 48, color: Theme.of(context).primaryColor)));
  buildMenu() => Container(
        decoration: backgroundDecoration,
      );

  List<Widget> buildPreferences() {
    List<Widget> widgets = [];
    // widgets.add(buildFormTitle(inks["label"]));
    // Map<String, List<String>> inkSettings =
    //     inks["settings"] as Map<String, List<String>>;
    // JACK YOU LEFT OFF RIGHT HERE. YOU WERE TOO HIGH AND BEGAN
    // ABSTRACTING OUT MID UI DESIGN

    return widgets;
  }

  buildScrollView() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(buildPreferences()),
        )
      ]));

  buildFormTitle(String title) => Container(
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 32)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0));

  buildFieldHeader(String headerText) => Container(
      child: Text(headerText,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      padding: EdgeInsets.only(top: 16));

  buildTextInputField(String hint, TextEditingController controller) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.white54),
            hintText: hint,
            fillColor: Theme.of(context).accentColor),
      ));
}
