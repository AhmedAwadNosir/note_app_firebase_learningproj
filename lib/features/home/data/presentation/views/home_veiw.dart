import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const id = "homeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                GoogleSignIn googleSignIn = GoogleSignIn();
                //for logout from google
                googleSignIn.disconnect();
                Navigator.pushReplacementNamed(context, LoginView.id);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
