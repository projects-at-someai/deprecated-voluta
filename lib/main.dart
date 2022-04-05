import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voluta_digital_trf/pages/passcode.page.dart';

import 'pages/about.page.dart';
import 'pages/customer.page.dart';
import 'pages/home.page.dart';
import 'pages/instructions.page.dart';
import 'pages/landing.page.dart';
import 'pages/settings.page.dart';
import 'pages/subscription.page.dart';
import 'pages/support.page.dart';

Future<void> main() async {
  Paint.enableDithering = true;

  //Ensures initialization so it does not hang
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xffC0A36C),
        accentColor: Color(0xff3A383A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (BuildContext context) => LandingPage(),
        "/help": (BuildContext context) => SupportPage(),
        "/about": (BuildContext context) => AboutPage(),
        "/new-client": (BuildContext context) => CustomerPage(),
        "/settings": (BuildContext context) => SettingsPage(),
        "/home": (BuildContext context) => HomePage(),
        "/subscriptions": (BuildContext context) => SubscriptionPage(),
        "/passcode": (BuildContext context) => PasscodePage()
      },
    );
  }
}
