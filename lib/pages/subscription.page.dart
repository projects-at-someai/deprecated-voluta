import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voluta_digital_trf/pages/subscription.details.page.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final dollar = new NumberFormat("#,##0.00", "en_US");
  int _selected;
  String _selectedPrice;
  int _remainingForms = 49;

  BoxDecoration get backgroundDecoration => BoxDecoration(
      gradient: LinearGradient(
          colors: [Theme.of(context).accentColor, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight));
  LinearGradient get gradient => LinearGradient(
      colors: [Color(0xff3A383A), Colors.black],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  @override
  void initState() {
    super.initState();
  }

  onSelected(int i, String price) {
    setState(() {
      this._selected = i;
      this._selectedPrice = price;
    });
  }

  onGuidePressed() {
    showDialog(
        context: context, builder: (context) => new SubscriptionDetailsPopup());
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildHeader(),
                  buildRemainingFormsLabel(),
                  buildRemainingForms(),
                  Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: buildGrid()),
                  buildDescription(),
                  buildGuideButton(),
                  buildPurchaseButton(),
                ])));
  }

  buildPurchaseButton() => GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.only(top: 32),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Icon(Icons.lock_outline, size: 32),
            Padding(
                child: Text("PAY NOW",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                padding: EdgeInsets.symmetric(horizontal: 16)),
            Expanded(child: Container()),
            Padding(
                child: Text("\$ $_selectedPrice",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                padding: EdgeInsets.symmetric(horizontal: 16)),
            Icon(Icons.arrow_forward, size: 32),
          ]),
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
          height: 100));

  buildDescription() => Text(
      "You control how and when you spend your money. We provide flexible options for individual artists and mega-shops alike. Purchase forms only when you need them or by monthly subscription. Purchases are charged to your Apple ID/credit card just like buying apps from the App Store.",
      style: TextStyle(
          color: Colors.white,
          height: 2,
          fontWeight: FontWeight.w500,
          wordSpacing: 1.5,
          fontSize: 18));

  buildHeader() => Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildClose(), buildTitle(), Container(width: 0, height: 0)],
      ),
      margin: EdgeInsets.only(top: 96));

  buildGrid() => GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.5,
          children: [
            buildOption(0, "9", "99", "50 Release Forms"),
            buildOption(1, "17", "99", "100 Release Forms"),
            buildOption(2, "31", "99", "200 Release Forms"),
            buildOption(3, "54", "99", "400 Release Forms"),
            buildOption(4, "79", "99", "Unlimited Forms Subscription",
                subscriptionTime: "mo"),
            buildOption(5, "9", "99", "Exporting Subscription",
                subscriptionTime: "year")
          ]);
  buildRemainingFormsLabel() => Text("REMAINING FORMS",
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold));

  buildRemainingForms() => Padding(
      padding: EdgeInsets.only(bottom: 16, top: 16),
      child: Text("$_remainingForms",
          style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor)));
              
  buildOption(num index, String dollars, String cents, String label,
      {String subscriptionTime}) {
    return GestureDetector(
        onTap: () => onSelected(index, dollars + "." + cents),
        child: Container(
            decoration: BoxDecoration(
                color: _selected == index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(16)),
            child: Stack(children: [
              Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPriceLabel(index, dollars, cents,
                            subscriptionTime: subscriptionTime),
                        buildPriceDescription(label)
                      ])),
              if (index == _selected)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 48,
                  ),
                )
            ])));
  }

  buildPriceDescription(String label) {
    return Text(label,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400));
  }

  buildPriceLabel(int index, String price, String cents,
          {String subscriptionTime}) =>
      RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "\$",
              style: TextStyle(
                  color: _selected == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 24)),
          TextSpan(
              text: price,
              style: TextStyle(
                  color: _selected == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 64,
                  fontWeight: FontWeight.w300)),
          TextSpan(
            text: ".$cents",
            style: TextStyle(
                color: _selected == index
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 32),
          ),
          if (subscriptionTime != null)
            TextSpan(
                text: "/$subscriptionTime",
                style: TextStyle(
                    color: _selected == index
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 24))
        ]),
      );
  buildGuideButton() => GestureDetector(
        onTap: () => onGuidePressed(),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).primaryColor))),
            child: Text(
              "NOT SURE WHAT TO BUY? CLICK HERE TO SEE OUR GUIDE AND POLICY",
              textHeightBehavior: TextHeightBehavior(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
      );
  buildClose() => IconButton(
      icon: Icon(
        Icons.close,
        size: 48,
      ),
      onPressed: () => print("Close Pressed"),
      color: Theme.of(context).primaryColor);
  buildTitle() => Text(
        "IN-APP PURCHASE",
        style: TextStyle(fontSize: 48, color: Theme.of(context).primaryColor),
        textAlign: TextAlign.center,
      );
}
