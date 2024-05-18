import 'package:chatty/features/base.dart';
import 'package:chatty/features/models/user_model.dart';

abstract class SignUpNavigator extends BaseNavigator{
goToHome(UserModel userModel);
}