import 'dart:async';

import 'package:chatty/models/room_model.dart';
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

  static CollectionReference<RoomModel> getRoomCollection() {
    return FirebaseFirestore.instance
        .collection(RoomModel.collectionName)
        .withConverter<RoomModel>(
          fromFirestore: (snapshot, _) => RoomModel.fromJson(snapshot.data()!),
          toFirestore: (room, _) => room.toJson(),
        );
  }

  static Future<void> addUser(UserModel userModel) async {
    return await getUserCollection().doc(userModel.id).set(userModel);
  }

  static Future<void> addRoom(RoomModel roomModel) async {
    var docRef = getRoomCollection().doc();
    roomModel.id = docRef.id;
    return await docRef.set(roomModel);
  }

  static Future<UserModel?> getUser(String id) async {
    var userRef = await getUserCollection().doc(id).get();
    return userRef.data();
  }

  static Future<List<RoomModel>> getRoom() async {
    var snapShotRoom = await getRoomCollection().get();
    List<RoomModel> rooms = snapShotRoom.docs.map((doc) => doc.data()).toList();
    return rooms;
  }

  static bool isLoggedBefore() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
