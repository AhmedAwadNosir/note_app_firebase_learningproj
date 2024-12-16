import 'package:flutter/material.dart';
import 'package:note_app/features/auth/presentation/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "LoginView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBodyBlocConsumer(),
    );
  }
}
