import 'dart:async';

import 'package:exam/utils/sharedhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool? islogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogin();
    Timer(Duration(seconds: 5), () {
      if (islogin == false) {
        Get.offNamed('signin');
      } else {
        Get.offNamed('navigator');
      }
    });
  }

  Future<void> getLogin() async {
    islogin = await Sharedhelper.sharedhelper.readLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/image/news.png',
            height: 100,
          ),
        ),
      ),
    );
  }
}
