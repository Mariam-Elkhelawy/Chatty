import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/chat/chat_navigator.dart';
import 'package:chatty/features/chat/chat_vm.dart';
import 'package:chatty/features/chat/widgets/receiver_message.dart';
import 'package:chatty/features/chat/widgets/sender_message.dart';
import 'package:chatty/features/models/message_model.dart';
import 'package:chatty/features/models/room_model.dart';
import 'package:chatty/features/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavigator {
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var room = ModalRoute.of(context)!.settings.arguments as RoomModel;
    viewModel.getMessages(room.id);
    var provider = Provider.of<UserProvider>(context,
        listen: false);

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(leadingWidth: 30,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          backgroundColor: AppColor.primaryColor,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/${room.catId}.jpg'),
              ),
              SizedBox(width: 12.w),
              Text(
                room.roomName,
                style: AppStyles.textButton,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot<MessageModel>>(
                      stream: viewModel.getMessages(room.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(color: AppColor.second,),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Error !'),
                          );
                        }
                        var messages =
                            snapshot.data?.docs.map((e) => e.data()).toList();
                        return ListView.builder(
                            itemBuilder: (context, index) {
                              print(messages?[index].senderName);
                              return provider.userModel?.id ==
                                      messages?[index].senderId
                                  ? SenderMessage(
                                      messageModel: messages![index],
                                    )
                                  : ReceiverMessage(
                                      messageModel: messages![index]);
                            },
                            itemCount: messages?.length ?? 0);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: customTextFormField(
                        controller: messageController,
                        fillColor: AppColor.primaryColor,
                        hintStyle: AppStyles.bodyS,
                        prefixIcon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: AppColor.whiteColor,
                          size: 20,
                        ),
                        cursorColor: AppColor.whiteColor,
                        textStyle: AppStyles.bodyM.copyWith(fontSize: 16.sp),
                        hintText: 'Message ...',
                        contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                        borderColor: AppColor.primaryColor,
                        radius: 25),
                  ),
                  SizedBox(width: 8.w),
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 22,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.whiteColor,
                      child: IconButton(
                        onPressed: () {
                          viewModel.sendMessage(
                            messageController.text,
                            room.id,provider.userModel!
                          );
                        },
                        icon: const Icon(
                          Icons.send,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  ChatViewModel initViewModel() {
    return ChatViewModel();
  }

  @override
  void clearController() {
    messageController.clear();
  }
}
