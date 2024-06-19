// ignore_for_file: dead_code

import 'dart:math';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_wiki/constants/colors/colors.dart';
import 'package:movie_wiki/constants/size/size.dart';
import 'package:movie_wiki/logic/Bloc/internet_bloc/internet_state.dart';
import 'package:movie_wiki/logic/Bloc/signupbloc/signup_bloc.dart';
import 'package:movie_wiki/pages/home/homepage.dart';
import 'package:movie_wiki/pages/login&signup/forgrtpassword.dart';
import 'package:movie_wiki/pages/login&signup/signup.dart';

import '../../logic/Bloc/loginbloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool _showPassword = false;
  bool _isRememberMe = false;
  bool loginError = true;
  bool agreeTerms = false;

  void toggleRememberMe() {
    setState(() {
      _isRememberMe = !_isRememberMe;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // RegisterRepository registerRepository = RegisterRepository();

  final formKey = GlobalKey<FormState>();

  login() {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      {
        BlocProvider.of<LoginBloc>(context).add(LoginTappedEvent(
            email: emailController.text.trim(),
            password: passController.text.trim()));
      }
    }
    
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  final String _text = 'Welcome To Movie Wiki!';
  final String _text1 = 'Enjoy Popular Movies!';

  final int _durationPerLetter = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: _text.length * _durationPerLetter),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: _text.length.toDouble())
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppSize size = AppSize(
          context: context,
        );
        if (state is InternetGainedState) {}
        return loginWidget(size, context);
      },
    );
  }

  loginWidget(AppSize size, BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: size.height(),
              color: whiteColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/movie_wiki.png',
                        width: 230,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Form(
                            // key: formKey,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                int currentLength = _animation.value.round();
                                String currentText = _text.substring(
                                    0, min(_text.length, currentLength));

                                return Text(
                                  currentText,
                                  style: GoogleFonts.inter(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: myBlack,
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                int currentLength = _animation.value.round();
                                String currentText1 = _text1.substring(
                                    0, min(currentLength, _text1.length));

                                return Text(
                                  currentText1,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: myGrey,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            TextFormField(
                              cursorColor: primaryColor,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                if (value.length < 10) {
                                  return 'Please enter valid Email';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  floatingLabelStyle: floatingLabelTextStyle(),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: greyColor,
                                  ),
                                  focusedBorder: customFocusBorder(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2)),
                                  labelStyle:
                                      TextStyle(color: greyColor, fontSize: 13),
                                  hintText: 'Email'),
                            ),
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                            TextFormField(
                              cursorColor: primaryColor,
                              controller: passController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.go,
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                  floatingLabelStyle: TextStyle(
                                      color: primaryColor, fontSize: 13),
                                  focusedBorder: customFocusBorder(),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2)),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: greyColor,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    icon: (_showPassword)
                                        ? Icon(
                                            Icons.visibility,
                                            color: greyColor,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: greyColor,
                                          ),
                                  ),
                                  labelStyle: GoogleFonts.inter(
                                      color: greyColor, fontSize: 13),
                                  hintText: 'Password'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isRememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _isRememberMe = !value!;
                                        });
                                        toggleRememberMe();
                                      },
                                    ),
                                    Text("Remember Me",
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: blackColor,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgetPassword()));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: GoogleFonts.inter(
                                        decoration: TextDecoration.underline,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: myBlack,
                                        // decoration: TextDecoration.underline,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CupertinoActivityIndicator());
                            }
                            return SizedBox(
                              height: 45,
                              width: 300,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                // height: 50,
                                color: primaryColor,
                                onPressed: () {
                                  // Get.to((context) => Homepage());
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Login',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          color: whiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: Get.width * 0.8,
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: primaryColor,
                                thickness: 2,
                                endIndent: 5,
                              ),
                            ),
                            Text(
                              'OR',
                              style: GoogleFonts.inter(
                                color: myBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: primaryColor,
                                thickness: 2,
                                indent: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      GestureDetector(
                        child: Container(
                          width: Get.width * 0.8,
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.06),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                width: 30,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Google',
                                style: GoogleFonts.inter(
                                  color: myBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<SignupBloc>(context)
                              .add(SignupTappedEvent());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Signup()));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "New To Movie Wiki? ",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                color: myBlack,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Register here",
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColor, width: 2));
  }

  TextStyle floatingLabelTextStyle() {
    return TextStyle(color: primaryColor, fontSize: 13);
  }
}
