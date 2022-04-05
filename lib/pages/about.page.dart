import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/ui/palette.dart';
import 'package:voluta_digital_trf/widgets/buttons.dart';
import 'package:voluta_digital_trf/widgets/text.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(32),
            decoration: Palette.background,
            child: Column(children: [
              VolutaText.header(context, "ABOUT VOLUTA DIGITAL"),
              VolutaText.body1(
                  "Voluta Digital is named after Conan's studio, Voluta Tattoo in Indianapolis, USA. Our practice of customized on-off creations now carries over to digital world. We love our practice our crazy body modification industry. We wanted to gift it something it loves: time and money. For family, for toys, for painting, for a walk in the woods."),
              Container(
                child: Row(
                  children: [buildAbout(), buildMission()],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                padding: EdgeInsets.only(top: 12, bottom: 12),
              ),
              buildAppShowcase(),
              VolutaText.body1(
                  "See the iPad App Store for our other tree-saving apps for the body modification industry",
                  center: true)
            ])));
  }

  buildAbout() => Expanded(
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(color: Palette.grey60.withOpacity(0.5)))),
          padding: EdgeInsets.only(right: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VolutaText.h1("ABOUT TRF"),
            VolutaText.body1(
                "TRF was invented, designed and coded by one tattoo artist and one serious tattoo collector. Conan Lea is an awarded 17 year custom tattoo artist and casual tinkerer. Dr. Francis Bowen, with rad ink progress, is an inventor and super thinker. TRF was made to help artists and studios get back to what matters: creating. "),
          ])));
  buildMission() => Expanded(
      child: Container(
          padding: EdgeInsets.only(left: 12),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VolutaText.h1("TRF MISSION"),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(children: [
                      Icon(Icons.check, color: Palette.gold60),
                      Container(width: 12),
                      VolutaText.body1("Reduce waste")
                    ])),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(children: [
                      Icon(Icons.check, color: Palette.gold60),
                      Container(width: 12),
                      VolutaText.body1("Save Time")
                    ])),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(children: [
                      Padding(
                          child: Icon(Icons.check, color: Palette.gold60),
                          padding: EdgeInsets.only(right: 12)),
                      VolutaText.body1("Save trees")
                    ])),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check, color: Palette.gold60),
                          Container(width: 12),
                          Flexible(
                            child: VolutaText.body1(
                                "Save studios and tattooers the money they don't realize they're losing"),
                          )
                        ]))
              ])));

  buildAppShowcase() => Container(
          child: Row(children: [
        buildApp("TATTOO RELEASE FORMS"),
        buildApp("PIERCING RELEASE FORMS"),
        buildApp("COSMETIC RELEASE FORMS")
      ]));

  buildApp(String title) => Expanded(
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: Palette.showcase,
                  child: VolutaButtons.logoMedium(context),
                )),
            Container(height: 12),
            VolutaText.h2(title),
            VolutaText.body1("BY VOLUTA DIGITAL")
          ])));
}
