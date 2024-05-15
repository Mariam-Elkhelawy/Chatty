import 'package:chatty/features/base.dart';
import 'package:chatty/features/login/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  String? message;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      message = 'Success';
      if (credential.user!.emailVerified) {
      } else {}
    } on FirebaseAuthException {
      message = 'Wrong Email Or Password';
    } catch (e) {
      message = e.toString();
    }
    if (message != null) {
      navigator!.hideDialog();
      navigator!.showMessage(message: message!);
    }
  }
}
