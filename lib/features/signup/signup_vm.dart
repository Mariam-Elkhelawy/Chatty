import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/core/errors/firebase_errors.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/models/user_model.dart';
import 'package:chatty/features/signup/signup_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel extends BaseViewModel<SignUpNavigator> {
  String? message;
  Future<void> createAccount(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
          id: credential.user?.uid ?? '',
          name: name,
          email: email,
          phone: phone);
     await DataBaseUtils.addUser(userModel);
     navigator!.hideDialog();
      navigator!.goToHome(userModel);
    } on FirebaseAuthException catch (e) {
      if (e.code == FireBaseErrors.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (e.code == FireBaseErrors.emailExist) {
        message = 'The account already exists for that email';
      }
    } catch (e) {
      message = e.toString();
    }
    if (message != null) {
      navigator!.hideDialog();
      navigator!.showMessage(message: message!);
    }
  }
}
