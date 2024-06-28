import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/constants.dart';
import 'package:movie_wiki/pages/home/base.dart';
import 'package:movie_wiki/pages/login&signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String KEYLOGIN = "login";

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    navigateToHome();
    
  }

  void navigateToHome() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedin = prefs.getBool(KEYLOGIN);
    // await Future.delayed(const Duration(seconds: 2));
    Future.delayed(Duration(seconds: 2), () {
      if (isLoggedin != null) {
        if (isLoggedin) {
          Get.offAll(() => Base());
        } else {
          Get.offAll(() => Login());
        }
      } else {
        Get.offAll(() => Login());
      }
    });

    // Get.offAll(() => Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: SizedBox(
                // color: Colors.amber,
                width: Get.width * 0.50,
                child: Image.asset(
                  'assets/icons/movie_wiki.png',
                  fit: BoxFit.fitWidth,
                  scale: 2,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
