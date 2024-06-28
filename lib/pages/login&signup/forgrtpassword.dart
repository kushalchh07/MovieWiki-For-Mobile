// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_wiki/constants/colors/colors.dart';

import '../../logic/Bloc/ResetPasswordBloc/reset_password_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

TextEditingController _emailAddressController = TextEditingController();

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Password reset email sent"),
              backgroundColor: Colors.green,
            ),
          );
          
          Navigator.pop(context);
        } else if (state is ResetPasswordErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forget Password"),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/forget_password.png",
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Please Enter Your Email To',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: myGrey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Receive a Verification Email Link.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: myGrey,
                      ),
                    ),
                    // Text(
                    //   'Please Check your email and click on',
                    //   style: GoogleFonts.inter(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w500,
                    //     color: myGrey,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: Get.width * 0.85,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailAddressController,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.email,
                                        color: greyColor,
                                      ),
                                    ),
                                    fillColor: inputFieldColor,
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Enter your email',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: Get.height * 0.06,
                      width: Get.width * 0.75,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: primaryColor,
                        onPressed: () {
                          BlocProvider.of<ResetPasswordBloc>(context).add(
                            ResetPasswordTappedEvent(
                              email: _emailAddressController.text,
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send',
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
                  ],
                ))),
      ),
    );
  }
}
