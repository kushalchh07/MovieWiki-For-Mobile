// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_wiki/logic/Bloc/signupbloc/signup_bloc.dart';
import 'package:movie_wiki/pages/home/base.dart';
import 'package:movie_wiki/pages/login&signup/signup.dart';

import '../../constants/colors/colors.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Verify Email"),
        // centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccessState) {
            Get.offAll(() => Base());
          } else if (state is SignupErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email_outlined, size: 150),
              Text(
                'Verify Your Email Address',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'We have just send email verification link on',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              Text(
                'your email. Please check email and click on',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              Text(
                'that link to verify your email address.',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Text(
                "If not auto redirected after verification,",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "click on Continue button",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 45,
                  width: 300,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: primaryColor,
                    onPressed: () {
                      context
                          .read<SignupBloc>()
                          .add(CheckEmailVerificationEvent());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text(
                          'Continue',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "If you did not receive any email. ",
                    style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                      onPressed: () {
                        context
                            .read<SignupBloc>()
                            .add(ResendEmailVerificationEvent()); 
                      },
                      child: Text(
                        "Resend Email",
                        style: TextStyle(color: primaryColor, fontSize: 18),
                      ))
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => Signup());
                },
                child: Container(
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor),
                  height: Get.height * 0.06,
                  width: Get.width * 0.32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_back, color: whiteColor),
                      Text(
                        "Go Back",
                        style: TextStyle(
                          // fontFamily: 'poppins',
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
