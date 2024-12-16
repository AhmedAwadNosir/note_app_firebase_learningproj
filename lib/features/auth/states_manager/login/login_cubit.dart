import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:note_app/features/auth/functions/show_awesome_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future LoginWithEamilAndPassword(
      {required String emailAddress,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccess(emailVerified: credential.user!.emailVerified));
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          emit(LoginFailure(errorMessage: 'No user found for that email.'));
        } else if (e.code == 'wrong-password') {
          emit(LoginFailure(
              errorMessage: 'Wrong password provided for that user.'));
        } else {
          emit(LoginFailure(errorMessage: e.toString()));
        }
      } else {
        emit(LoginFailure(errorMessage: e.toString()));
      }
    }
  }
}
