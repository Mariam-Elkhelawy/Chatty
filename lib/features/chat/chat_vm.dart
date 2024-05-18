import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/chat/chat_navigator.dart';
import 'package:chatty/features/models/message_model.dart';
import 'package:chatty/features/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  void sendMessage(String messageContent, String roomId,UserModel userModel) {
    MessageModel messageModel = MessageModel(
        content: messageContent,
        dateTime: DateTime.now().microsecondsSinceEpoch,
        roomId: roomId,
        senderName: userModel.name,
        senderId: userModel.id );
    DataBaseUtils.addMessage(messageModel)
        .then((value) => navigator!.clearController());
  }

   Stream<QuerySnapshot<MessageModel>> getMessages(String roomId)  {
    return DataBaseUtils.getMessage(roomId);
  }
}
