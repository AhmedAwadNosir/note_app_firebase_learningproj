import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_google_state.dart';

class LoginGoogleCubit extends Cubit<LoginGoogleState> {
  LoginGoogleCubit() : super(LoginGoogleInitial());
  Future<UserCredential?> LoginWithGoogle() async {
    emit(LoginGoogleLoading());
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //if i canceld login
      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(LoginGoogleSuccess());
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      emit(LoginGoogleFailure(errorMessage: e.toString()));
    }
  }
}
