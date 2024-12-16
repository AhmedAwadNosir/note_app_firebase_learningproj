import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import '../../states_manager/resset_password/resset_password_cubit.dart';

class ForgotPasswordButtonBloclistner extends StatelessWidget {
  const ForgotPasswordButtonBloclistner({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RessetPasswordCubit, RessetPasswordState>(
      listener: (context, state) {
        if (state is RessetPasswordSuccess) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              dialogTitle: "Success",
              dialogDesc:
                  "We sented reset passaword email to your gmail go and resset your password");
        }
        if (state is RessetPasswordFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc: state.errorMessage);
        }
      },
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "Forgot Password?",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.9)),
        ),
      ),
    );
  }
}
