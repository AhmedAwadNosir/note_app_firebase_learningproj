import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/auth/presentation/widgets/login_view_body.dart';
import 'package:note_app/features/auth/states_manager/login/login_cubit.dart';
import 'package:note_app/features/home/presentation/views/notes_categorys_view.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          state.emailVerified
              ? Navigator.pushReplacementNamed(context, NotesCategoriesView.id)
              : showAwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  dialogTitle: "Error",
                  dialogDesc:
                      "this emial is not verified please go to your Gmail and verify your email to continue!");
        }
        if (state is LoginFailure) {
          showAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            dialogTitle: "Error",
            dialogDesc: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
