import 'package:flutter/material.dart';

class SubscriptionDetailsPopup extends StatelessWidget {
  final ScrollController controller = new ScrollController();
  final String purchaseText =
      "You control how and when you spend your money. We provide flexible options for individual artists and mega-shops alike. Purchase forms only when you need them or by monthly subscription. Purchases are charged to your Apple ID/credit card just like buying apps from the App Store. Please read the information below carefully and tick the check to continue purchase.";
  final String bundleText =
      "To purchase a bundle of 50-400 forms, tap your choice and press pay now to purchase. These forms can only be used on this iPad, with this Apple ID. They will be stored in this iPad only, and cannot be transferred to another iPad for any reason (Apple's rules). Unused forms on this iPad never expire. An economical choice for smaller shops and individual/traveling artists.";
  final String subscriptionText =
      "Enables unlimited uses of TRF on up to five iPads that are all using the same Apple ID. 365 Client Data Export is included for free! Intended for large or multiple shops, this subscription renews monthly with an email reminder and opt-out sent to you from Apple.";
  final String dataText =
      "Enables a year of exports, anytime you wish, to be used with any number of forms you purchase. This export organizes all (non-health) details of your clients, exported into a tidy .csv spreadsheet, Key insights for targeted marketing!";
  final String additionText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquam est metus, et semper dui hendrerit quis. In eget ligula id metus iaculis ultricies ac id metus. Donec malesuada, diam nec accumsan condimentum, ipsum magna hendrerit nunc, in lacinia velit ipsum interdum neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc cursus enim ac tincidunt varius. Cras fringilla tellus metus, a finibus nibh auctor at.";
  final TextStyle subtitleStyle = TextStyle(
      color: Colors.white,
      height: 2,
      fontSize: 18,
      fontWeight: FontWeight.w400);
  TextStyle titleStyle(BuildContext context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 36,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 96, vertical: 128),
        child: Material(
            color: Colors.transparent,
            child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Material(
                              color: Colors.transparent,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).primaryColor)),
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.close,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ))),
                    Expanded(
                        child: Scrollbar(
                      child: ListView(children: [
                        buildInAppPurchaseSection(context),
                        buildBundlesSection(context),
                        buildSubscriptionSection(context),
                        buildDataExportSection(context),
                        buildAdditionalInfo(context)
                      ]),
                    ))
                  ],
                ))));
  }

  Widget padding(Widget widget) =>
      Padding(child: widget, padding: EdgeInsets.symmetric(vertical: 16));
  buildInAppPurchaseSection(BuildContext context) => padding(ListTile(
      title: Text("IN APP PURCHASE", style: titleStyle(context)),
      subtitle: Text(purchaseText, style: subtitleStyle)));

  buildBundlesSection(BuildContext context) => padding(ListTile(
      title: Text("BUNDLES", style: titleStyle(context)),
      subtitle: Text(bundleText, style: subtitleStyle)));

  buildSubscriptionSection(BuildContext context) => padding(ListTile(
      title: Text("UNLIMITED SUBSCRIPTION", style: titleStyle(context)),
      subtitle: Text(subscriptionText, style: subtitleStyle)));

  buildDataExportSection(BuildContext context) => padding(ListTile(
      title: Text("365 CLIENT DATA EXPORT", style: titleStyle(context)),
      subtitle: Text(dataText, style: subtitleStyle)));

  buildAdditionalInfo(BuildContext context) => padding(ListTile(
      title: Text("ADDITIONAL INFO", style: titleStyle(context)),
      subtitle: Text(additionText, style: subtitleStyle)));
}
