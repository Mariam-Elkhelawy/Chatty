import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/login/login_navigator.dart';
import 'package:chatty/models/user_model.dart';
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
      UserModel? userModel =
          await DataBaseUtils.getUser(credential.user?.uid ?? '');
      if (userModel != null) {
        navigator!.hideDialog();
        navigator!.goToHome(userModel);
      } else {
        message = 'User Not Found';
      }
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
