import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/auth/presentation/views/register_view.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_app_logo.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:note_app/features/auth/presentation/widgets/custom_text_form_fild_option.dart';
import 'package:note_app/features/auth/presentation/widgets/forgot_passwor_button_bloc_listner.dart';
import 'package:note_app/features/auth/presentation/widgets/login_google_button_bloc_consumer.dart';
import 'package:note_app/features/auth/states_manager/login/login_cubit.dart';
import 'package:note_app/features/auth/states_manager/resset_password/resset_password_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> key = GlobalKey();
    String? email, password;
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
                  "Login",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Login To Continue Using The App",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: screenHight * 0.03),
                CustomTextFormFildOption(
                  title: "Email",
                  hint: "Enter Your Email",
                  onSaved: (value) {
                    email = value;
                  },
                  onChanged: (value) {
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
            ForgotPasswordButtonBloclistner(
              onTap: () {
                if (email == null || email!.isEmpty) {
                  showAwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      dialogTitle: "Error",
                      dialogDesc:
                          "Email filed cann`t be empty please enter your email");
                } else {
                  BlocProvider.of<RessetPasswordCubit>(context)
                      .sendRessetPasswordEmail(email: email!);
                }
              },
            ),
            SizedBox(height: screenHight * 0.03),
            SizedBox(
              height: 45,
              child: CustomElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    key.currentState!.save();

                    BlocProvider.of<LoginCubit>(context)
                        .LoginWithEamilAndPassword(
                            emailAddress: email!,
                            password: password!,
                            context: context);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                buttonName: "login",
              ),
            ),
            SizedBox(height: screenHight * 0.03),
            const LoginGoogleButtonBlocConsumer(),
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
                    Navigator.pushReplacementNamed(context, RegisterView.id);
                  },
                  child: const Text(
                    "Rigester",
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
