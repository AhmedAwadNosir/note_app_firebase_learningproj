import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

showAwesomeDialog(
    {required BuildContext context,
    required DialogType dialogType,
    required String dialogTitle,
    required String dialogDesc}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: dialogTitle,
    desc: dialogDesc,
    btnCancelOnPress: () {
      FirebaseAuth.instance.signOut();
    },
    btnOkOnPress: () {},
  ).show();
}
