import 'package:flutter/material.dart';
import 'package:note_app/features/auth/presentation/widgets/register_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const id = "RegisterView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterViewBodyBlocConsumer(),
    );
  }
}
