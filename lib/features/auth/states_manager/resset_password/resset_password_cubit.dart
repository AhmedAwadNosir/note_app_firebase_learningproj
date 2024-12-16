import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'resset_password_state.dart';

class RessetPasswordCubit extends Cubit<RessetPasswordState> {
  RessetPasswordCubit() : super(RessetPasswordInitial());

  Future<void> sendRessetPasswordEmail({required String email}) async {
    emit(RessetPasswordLoading());
    try {
      log("emial: $email");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      emit(RessetPasswordSuccess());
      // in new versioin of firebase dont have an error this user is not
      // recoarded becaus of enabling email enumeration protection.
    } catch (e) {
      emit(RessetPasswordFailure(errorMessage: e.toString()));
    }
  }
}
