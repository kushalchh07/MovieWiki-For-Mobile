// ignore_for_file: unused_element, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_bloc.dart';
// import 'package:movie_wiki/logic/Bloc/internet/internet_bloc.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_state.dart';
import 'package:movie_wiki/logic/Bloc/signupbloc/signup_bloc.dart';
import 'package:movie_wiki/pages/login&signup/login.dart';
import 'package:movie_wiki/utils/customWidgets/alert_dialog_box.dart';

import '../../constants/colors/colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _newPassword = false;
  final fnameController = TextEditingController();
  // final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  final contactController = TextEditingController();
  // final couponController = TextEditingController();
  bool registerError = true;
  bool loginError = true;
  bool agreeTerms = false;

  @override
  void dispose() {
    super.dispose();
    fnameController.dispose();
    // lnameController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    // confirmPasswordController.dispose();
  }

  signup() {
    if (_formKey.currentState!.validate()) {
      (agreeTerms)
          ? BlocProvider.of<SignupBloc>(context).add(SignupTappedEvent(
              email: emailController.text.trim(),
              fname: fnameController.text.trim(),
              contact: contactController.text.trim(),
              password: newPasswordController.text.trim()))
          : customAlertBox(
              context,
              'Please make sure you accept the terms and condition before proceeding',
              '',
              () {},
              'Close',
              () {
                Navigator.pop(context);
              },
            );
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetConnected) {
          return registerScreen(context);
        }
        // return const Scaffold(
        //   body: Center(
        //     child: CupertinoActivityIndicator(),
        //   ),
        // );
        return registerScreen(context);
      },
    );
  }

  registerScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: whiteColor,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Image.asset(
                    'assets/icons/movie_wiki.png',
                    width: 200,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Let's Get Started !",
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: myBlack,
                          ),
                        ),
                        Text(
                          "Create An account To Get All Features",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: myGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),

                            TextFormField(
                              cursorColor: secondaryColor,
                              controller: fnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your name';
                                } else if (!RegExp(r'[a-zA-Z]')
                                    .hasMatch(value)) {
                                  // Checks if the value contains at least one alphabetic character
                                  return 'Name should contain at least one letter';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  floatingLabelStyle: floatingLabelTextStyle(),
                                  focusedBorder: customFocusBorder(),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: greyColor,
                                  ),
                                  fillColor: inputFieldColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),

                                  // labelText: ' Enter your name',
                                  hintText: ' Enter your name ',
                                  labelText: 'Enter your name',
                                  hintStyle: TextStyle(
                                    fontFamily: 'inter',
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            const SizedBox(height: 15),

                            TextFormField(
                              cursorColor: primaryColor,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Email';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  floatingLabelStyle: floatingLabelTextStyle(),
                                  focusedBorder: customFocusBorder(),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: greyColor,
                                  ),
                                  fillColor: inputFieldColor,
                                  filled: true,
                                  labelStyle:
                                      TextStyle(color: greyColor, fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'Email',
                                  hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400)),
                            ),
                            const SizedBox(height: 10),
                            //Phone Number

                            TextFormField(
                              cursorColor: primaryColor,
                              controller: contactController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter contact number';
                                }
                                if (value.length < 10) {
                                  return 'Phone Number cannot be less than 10';
                                }
                                if (value.length > 10) {
                                  return 'Phone Number cannot be greater than 10';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                floatingLabelStyle: floatingLabelTextStyle(),
                                focusedBorder: customFocusBorder(),
                                fillColor: inputFieldColor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelStyle:
                                    TextStyle(color: greyColor, fontSize: 13),
                                hintText: 'Phone Number ',
                                hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: greyColor,
                                ),
                              ),
                            ),
                            //New Password
                            const SizedBox(height: 10),

                            TextFormField(
                              cursorColor: primaryColor,
                              controller: newPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter new password';
                                }
                                if (value.length < 8) {
                                  return 'Password must contain at least 8 characters';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.newline,
                              obscureText: !_newPassword,
                              decoration: InputDecoration(
                                floatingLabelStyle: floatingLabelTextStyle(),
                                focusedBorder: customFocusBorder(),
                                fillColor: inputFieldColor,
                                filled: true,
                                labelStyle:
                                    TextStyle(color: greyColor, fontSize: 13),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _newPassword = !_newPassword;
                                    });
                                  },
                                  icon: (_newPassword)
                                      ? Icon(
                                          Icons.visibility,
                                          color: greyColor,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: greyColor,
                                        ),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Password ',
                                hintStyle: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: greyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // TextFormField(
                            //   cursorColor: primaryColor,
                            //   controller: confirmPasswordController,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Enter Confirm password';
                            //     }
                            //     if (value.length < 8) {
                            //       return 'Password must contain atleast 8 character';
                            //     }
                            //     if (newPasswordController !=
                            //         confirmPasswordController) {
                            //       return 'Both passwords doesnot match';
                            //     }
                            //     return null;
                            //   },
                            //   textInputAction: TextInputAction.newline,
                            //   obscureText: !_newPassword,
                            //   decoration: InputDecoration(
                            //     floatingLabelStyle: floatingLabelTextStyle(),
                            //     focusedBorder: customFocusBorder(),
                            //     fillColor: inputFieldColor,
                            //     filled: true,
                            //     labelStyle:
                            //         TextStyle(color: greyColor, fontSize: 13),
                            //     suffixIcon: IconButton(
                            //       onPressed: () {
                            //         setState(() {
                            //           _newPassword = !_newPassword;
                            //         });
                            //       },
                            //       icon: (_newPassword)
                            //           ? Icon(
                            //               Icons.visibility,
                            //               color: greyColor,
                            //             )
                            //           : Icon(
                            //               Icons.visibility_off,
                            //               color: greyColor,
                            //             ),
                            //     ),
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10)),
                            //     hintText: 'Confirm Password ',
                            //     prefixIcon: Icon(
                            //       Icons.lock,
                            //       color: greyColor,
                            //     ),
                            //     hintStyle: GoogleFonts.inter(
                            //         fontWeight: FontWeight.w400),
                            //   ),
                            // ),
                            // Visibility(
                            //   visible: Platform.isAndroid,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(top: 10),
                            //     child: Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Card(
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(10)),
                            //           color: primaryColor,
                            //           child: IconButton(
                            //               onPressed: null,
                            //               disabledColor: whiteColor,
                            //               icon: const Icon(Icons.redeem)),
                            //         ),
                            //         Flexible(
                            //           child: TextFormField(
                            //             controller: couponController,
                            //             textInputAction: TextInputAction.next,
                            //             decoration: InputDecoration(
                            //                 fillColor: inputFieldColor,
                            //                 filled: true,
                            //                 border: UnderlineInputBorder(
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             10)),
                            //                 hintText:
                            //                     ' Enter Referral Code(Optional)'),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: agreeTerms,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            setState(() {
                              agreeTerms = !agreeTerms;
                            });
                          }),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            agreeTerms = !agreeTerms;
                          });
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'I accept the terms and services',
                            style: GoogleFonts.inter(
                                color: myBlack,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ])),
                      ),
                    ],
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    builder: (context, state) {
                      if (state is SignupLoadingState) {
                        return const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: primaryColor,
                            onPressed: signup,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sign up',
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
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.grey,
                                // decoration: TextDecoration.underline,
                              ),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'Login here',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                style: GoogleFonts.inter(
                                    decoration: TextDecoration.underline,
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ])),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const WebViewScreen(
                  //           isTermsConditions: true,
                  //           url: 'https://a2zonlineinstitute.com/term',
                  //           title: 'Terms And Conditions',
                  //         ),
                  //       ));
                  //     },
                  //     child: RichText(
                  //       textAlign: TextAlign.center,
                  //       text: TextSpan(
                  //         text: 'Joining our app means you agree with our ',
                  //         style: GoogleFonts.inter(
                  //             fontWeight: FontWeight.w400,
                  //             color: dreamGrey,
                  //             fontSize: 13),
                  //         children: <TextSpan>[
                  //           TextSpan(text: '\n'),
                  //           TextSpan(
                  //             text: 'Terms and conditions',
                  //             style: GoogleFonts.inter(
                  //               fontWeight: FontWeight.w400,
                  //               fontSize: 13,
                  //               color: const Color.fromARGB(
                  //                   255, 44, 60, 155), // Make the text blue
                  //               decoration:
                  //                   TextDecoration.underline, // Add underline
                  //             ),
                  //           ),
                  //           const TextSpan(
                  //             text: '.',
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder customFocusBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: primaryColor, width: 2));
}

TextStyle floatingLabelTextStyle() {
  return TextStyle(color: primaryColor, fontSize: 13);
}
