import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';
import 'package:note_app/features/auth/presentation/views/login_view.dart';
import 'package:note_app/features/auth/presentation/widgets/register_view_body.dart';
import 'package:note_app/features/auth/states_manager/register/register_cubit.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          Navigator.pushReplacementNamed(context, LoginView.id);
        }
        if (state is RegisterFailure) {
          showAwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              dialogTitle: "Error",
              dialogDesc: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is RegisterLoding,
            child: const RegisterViewBody());
      },
    );
  }
}
