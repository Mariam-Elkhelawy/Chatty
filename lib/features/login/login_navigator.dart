import 'package:chatty/features/base.dart';
import 'package:chatty/features/models/user_model.dart';

abstract class LoginNavigator extends BaseNavigator{
  void goToHome(UserModel userModel);
}