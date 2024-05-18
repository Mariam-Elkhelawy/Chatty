import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/models/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReceiverMessage extends StatelessWidget {
  const ReceiverMessage({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(messageModel.dateTime);
    var formatter = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColor.second.withOpacity(.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
              bottomRight: Radius.circular(18.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageModel.senderName,
                style: AppStyles.bodyS.copyWith(color: AppColor.primaryColor),
              ),
              Text(
                messageModel.content,
                style: AppStyles.bodyM.copyWith(color: AppColor.whiteColor),
              ),
              Text(
                formatter.substring(12),
                style: AppStyles.bodyS.copyWith(fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }
}
