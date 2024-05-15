import 'package:chatty/core/errors/firebase_errors.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/signup/signup_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator> {
  String? message;
  Future<void> createAccount(
      {required String email, required String password}) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (e.code == FireBaseErrors.emailExist) {
        message= 'The account already exists for that email';
      }
    } catch (e) {
      message= e.toString();
    }if (message != null) {
      navigator!.hideDialog();
      navigator!.showMessage(message: message!);
    }
  }
}
