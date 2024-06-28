import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import '../../constants/colors/colors.dart';

// ignore: must_be_immutable
class InternetLostScreen extends StatefulWidget {
  final bool isNeedToLogin;
  InternetLostScreen({super.key, this.indexNum, this.isNeedToLogin = false});
  int? indexNum;

  @override
  State<InternetLostScreen> createState() => _InternetLostScreenState();
}

class _InternetLostScreenState extends State<InternetLostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          // color: Colors.amber,
          height: Get.height * 0.8,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Oops!',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.height * 0.32,
                  width: double.maxFinite,
                  child: Image.asset(
                    'assets/images/no_internet.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'You’re offline',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Something went wrong',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: textColor,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Check your internet connection.',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              if (widget.isNeedToLogin == false)
                MaterialButton(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    // Get.offAll(() => const Downloads());
                  },
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
