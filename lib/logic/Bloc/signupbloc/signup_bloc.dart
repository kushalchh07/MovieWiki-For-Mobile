// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:developer';
// import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:movie_wiki/constants/constants.dart';
import 'package:movie_wiki/pages/home/base.dart';
import 'package:movie_wiki/pages/login&signup/login.dart';
import 'package:movie_wiki/pages/login&signup/signup.dart';
import 'package:movie_wiki/services/firebaseAuth_service.dart';

import '../../../constants/colors/colors.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupTappedEvent>(_signupTappedEvent);
  }

  FutureOr<void> _signupTappedEvent(
      SignupTappedEvent event, Emitter<SignupState> emit) async {
    log("Signup Tapped");
    try {
      final email = event.email;
      final password = event.password;
      final fname = event.fname;
      final contact = event.contact;
      emit(SignupLoadingState());
      log("Signup loading");

      // await Future.delayed(Duration(seconds: 1));
      // await AuthService.createAccountWithEmail(email, password);
      saveName(fname);
      saveEmail(email);
      saveContact(contact);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          saveStatus(true);
          Get.to(() => Base());
          Fluttertoast.showToast(
            msg: 'Signup Sucessfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: whiteColor,
          );
        } else {
          Fluttertoast.showToast(
            msg: 'Invalid email or password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: whiteColor,
          );
        }
      });

      log("Account Created");

      emit(SignupSuccessState());
      log("Signup Successfull");
    } on FirebaseAuthException catch (e) {
      // return e.message.toString();
      log("$e");
    } catch (e) {
      log("Error occured during signup $e");
    }
  }
}
