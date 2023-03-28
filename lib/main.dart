import 'package:exam/details/view/detailPage.dart';
import 'package:exam/home/view/homePage.dart';
import 'package:exam/navigator/navigatorPage.dart';
import 'package:exam/signin/view/signInpage.dart';
import 'package:exam/signup/signUpPage.dart';
import 'package:exam/splashscreen/splashscrren.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'offline/view/offline.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => Splashscreen(),
        'signin': (p0) => SignInPage(),
        'signup': (p0) => SignUpPage(),
        'navigator': (p0) => NavigatorPage(),
        'home': (p0) => HomePage(),
        'offline': (p0) => OfflinePage(),
        'detail': (p0) => DetailPage(),
      },
    ),
  );
}
