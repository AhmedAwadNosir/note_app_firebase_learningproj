import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_app_logo.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_fild_option.dart';
import 'package:note_app/features/auth/states_manager/register/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> key = GlobalKey();
    String? email, password, userName;
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: key,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHight * 0.07),
                const Center(child: CustomAppLogo()),
                SizedBox(height: screenHight * 0.05),
                const Text(
                  "SignUP",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "SignUP To Continue Using The App",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHight * 0.03),
                CustomTextFormFildOption(
                  title: "Username",
                  hint: "Enter Your Username",
                  onSaved: (value) {
                    userName = value;
                  },
                ),
                SizedBox(height: screenHight * 0.02),
                CustomTextFormFildOption(
                  title: "Email",
                  hint: "Enter Your Email",
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: screenHight * 0.02),
                CustomTextFormFildOption(
                  title: "Password",
                  hint: "Enter Your Password",
                  onSaved: (value) {
                    password = value;
                  },
                ),
              ],
            ),
            SizedBox(height: screenHight * 0.01),
            Text(
              "Forgot Password?",
              textAlign: TextAlign.right,
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.9)),
            ),
            SizedBox(height: screenHight * 0.03),
            SizedBox(
              height: 45,
              child: CustomElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    BlocProvider.of<RegisterCubit>(context)
                        .registerWithEamilAndPassword(
                            emailAddress: email!, password: password!);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                buttonName: "Register",
              ),
            ),
            SizedBox(height: screenHight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don`t Have An Account?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.9)),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginView.id);
                  },
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, color: Colors.orange),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
