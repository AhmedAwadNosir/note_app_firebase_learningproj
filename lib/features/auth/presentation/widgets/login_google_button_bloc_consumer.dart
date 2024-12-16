import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/auth/presentation/widgets/custsom_sochial_auth_button.dart';
import 'package:note_app/features/auth/states_manager/login_google/login_google_cubit.dart';
import 'package:note_app/features/home/data/presentation/views/home_veiw.dart';

class LoginGoogleButtonBlocConsumer extends StatelessWidget {
  const LoginGoogleButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginGoogleCubit, LoginGoogleState>(
      listener: (context, state) {
        if (state is LoginGoogleSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.id);
        }
        if (state is LoginGoogleFailure) {
          showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: "Error",
            dialogDesc: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          child: CustsomSochialAuthButton(
            onPressed: () {
              BlocProvider.of<LoginGoogleCubit>(context).LoginWithGoogle();
            },
            buttonName: "Login With Google",
          ),
        );
      },
    );
  }
}
