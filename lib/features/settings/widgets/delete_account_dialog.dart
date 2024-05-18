import 'dart:ui';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key, required this.onDeleteTapped});
  final VoidCallback onDeleteTapped;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: AppColor.whiteColor,
        contentPadding: EdgeInsets.zero,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                backgroundColor: AppColor.primaryColor),
            child: Text(
              AppStrings.cancel,
              style: AppStyles.bodyS.copyWith(color: AppColor.whiteColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onDeleteTapped();
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                backgroundColor: AppColor.primaryColor),
            child: Text(
              'Delete',
              style: AppStyles.bodyS.copyWith(color: AppColor.whiteColor),
            ),
          ),
        ],
        insetPadding: EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: SizedBox(
          height: 110,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: SizedBox(
              width: 350.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.deleteAccount,
                    style:
                        AppStyles.bodyM.copyWith(color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppStrings.deleteAccountSure,
                    style: AppStyles.bodyM
                        .copyWith(color: AppColor.primaryColor.withOpacity(.8)),
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
