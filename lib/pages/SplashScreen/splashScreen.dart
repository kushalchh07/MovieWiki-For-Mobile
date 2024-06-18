import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_wiki/pages/login&signup/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateTohome();
  }

  _navigateTohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    if (context == null) {
      return CupertinoActivityIndicator(); // or any other widget you want to display while waiting for the context to be available
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
          // color: Colors.amber,
          width: Get.width,
          height: Get.height,
          child: Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.cover,
            scale: 2,

            // width: Get.width,
          ),
        ),
      ),
    );
  }
}
