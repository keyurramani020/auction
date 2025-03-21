import 'dart:io';

import 'package:btt/View/Auth/Authinco.dart';
import 'package:btt/View/Auth/editprofile.dart';
import 'package:btt/View/Auth/login.dart';
import 'package:btt/View/Auth/profile.dart';
import 'package:btt/View/Auth/unauthprofile.dart';
import 'package:btt/View/Auth/verify.dart';
import 'package:btt/View/Auth/verifyed.dart';
import 'package:btt/View/Home/auctionhistory.dart';
import 'package:btt/View/Home/autobid.dart';
import 'package:btt/View/Home/autobidding.dart';
import 'package:btt/View/Home/bidlog.dart';
import 'package:btt/View/Home/bidsubmitted.dart';
import 'package:btt/View/Home/details.dart';
import 'package:btt/View/Home/home.dart';
import 'package:btt/View/Home/itemselection.dart';
import 'package:btt/View/Home/manualbidding.dart';
import 'package:btt/View/Home/onboarding.dart';
import 'package:btt/View/Home/terms&conditions.dart';
import 'package:btt/View/Home/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/Utilites/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  final shrad = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(
      user: shrad.getString(userid),
    ));
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  var user;
  MyApp({super.key, required this.user});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bidding Tender tiger',
      initialRoute: "/onboarding",
      debugShowCheckedModeBanner: false,
      routes: {
        "/onboarding": (context) => OnBoarding(),
        "/login": (context) => Login(),
        "/verify": (context) => VerifyPage(),
        "/verifyed": (context) => Verifyed(),
        "/home": (context) => HomePage(),
        "/details": (context) => Details(),
        "/authinco": (context) => Authenticationincomplete(),
        "/termsconditions": (context) => TermsConditions(),
        "/autobidding": (context) => autobidding(),
        "/yourrank": (context) => autobidpage(),
        "/bidsubmitted": (context) => bidsubmitted(),
        "/auctionhistory": (context) => auctionhistory(),
        "/profile": (context) => Profile(),
        "/editprofile": (context) => EditProfile(),
        "/unauthprofile": (context) => UnauthProfile(),
        "/itemselection": (context) => ItemSelection(),
        "/test": (context) => test(),
        "/manualbidding": (context) => ManualBidding(),
        "/BidLogpage": (context) => BidLogpage(),
      },
    );
  }
}
