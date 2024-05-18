import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  late User user;

  UserProvider() {
    user = FirebaseAuth.instance.currentUser!;
    initMyUser();
  }

  initMyUser() async {
    userModel = await DataBaseUtils.getUser(user.uid);
  }
}
