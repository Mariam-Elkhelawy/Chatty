import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/models/room_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({super.key, required this.roomModel});
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutesName.chat, arguments: roomModel);
        },
        child: Material(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 28.0.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(
                            'assets/images/${roomModel.catId}.jpg',
                          ),
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.black.withOpacity(.4),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 33.h),
                          child: Container(
                            width: double.infinity,
                            height: 25,
                            color: AppColor.whiteColor.withOpacity(.5),
                            child: Center(
                              child: Text(
                                roomModel.roomName,
                                style: AppStyles.textButton
                                    .copyWith(color: AppColor.primaryColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    roomModel.roomDescription,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bodyS.copyWith(
                      fontSize: 14,
                      color: AppColor.primaryColor
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
