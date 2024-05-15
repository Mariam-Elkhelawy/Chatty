import 'package:chatty/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseUtils {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> addUser(UserModel userModel) {
    return getUserCollection().doc(userModel.id).set(userModel);
  }

  static Future<UserModel?> getUser(String id) async {
    var userRef = await getUserCollection().doc(id).get();
    return userRef.data();
  }

  static bool isLoggedBefore() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
