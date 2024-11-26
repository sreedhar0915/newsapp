import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:newsapp/utils/apputils.dart';
import 'package:newsapp/view/loginscreen/loginscreen.dart';

class RegisterscreenController with ChangeNotifier {
  bool isloading = false;
  Future<void> onRegisteration(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    isloading = true;
    notifyListeners();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log(credential.user?.uid.toString() ?? "");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
      if (credential.user?.uid != null) {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.green,
            message: 'Registration successful');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.red,
            message: 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        AppUtils.showOnetimeSnackbar(
            context: context,
            bg: Colors.red,
            message: 'The account already exists for that email.');

        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    isloading = false;
    notifyListeners();
  }
}
