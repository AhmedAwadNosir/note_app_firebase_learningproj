import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';

signOut({required BuildContext context}) {
  try {
    FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    //for logout from google
    googleSignIn.disconnect();
    Navigator.pushReplacementNamed(context, LoginView.id);
  } catch (e) {
    showAwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        dialogTitle: "Error",
        dialogDesc: "Check Your Internet Conection !");
    debugPrint(e.toString());
  }
}
