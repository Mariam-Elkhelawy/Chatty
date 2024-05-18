import 'dart:ui';

import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPasswordDialog extends StatefulWidget {
  EditPasswordDialog(
      {super.key,
      required this.onChangeTapped,
      required this.newPasswordController,
      required this.currentPasswordController});
  final VoidCallback onChangeTapped;
  TextEditingController newPasswordController;
  TextEditingController currentPasswordController;
  @override
  State<EditPasswordDialog> createState() => _EditPasswordDialogState();
}

class _EditPasswordDialogState extends State<EditPasswordDialog> {
  bool isNew = true;
  bool isCurrent = true;
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
            onPressed: () async {
              widget.onChangeTapped();
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                backgroundColor: AppColor.primaryColor),
            child: Text(
              'Change',
              style: AppStyles.bodyS.copyWith(color: AppColor.whiteColor),
            ),
          ),
        ],
        insetPadding: EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        content: SizedBox(
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.editPassword,
                  style: AppStyles.bodyM.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 50,
                  child: customTextFormField(
                      borderColor: AppColor.primaryColor.withOpacity(.1),
                      cursorColor: AppColor.primaryColor,
                      isPassword: isCurrent,
                      textStyle:
                          AppStyles.generalText.copyWith(fontSize: 16.sp),
                      onValidate: (value) {
                        if (value == '' || value == null) {
                          return AppStrings.passwordValidate;
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          isCurrent = !isCurrent;
                          setState(() {});
                        },
                        icon: Icon(
                          isCurrent ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 16.w),
                      radius: 5.r,
                      hintText: 'enter your current password',
                      fillColor: AppColor.primaryColor.withOpacity(.1),
                      controller: widget.currentPasswordController),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: customTextFormField(
                    borderColor: AppColor.primaryColor.withOpacity(.1),
                    cursorColor: AppColor.primaryColor,
                    isPassword: isNew,
                    textStyle: AppStyles.generalText.copyWith(fontSize: 16.sp),
                    onValidate: (value) {
                      if (value == '' || value == null) {
                        return AppStrings.passwordValidate;
                      }
                      return null;
                    },
                    controller: widget.newPasswordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isNew = !isNew;
                        setState(() {});
                      },
                      icon: Icon(
                        isNew ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                    radius: 5.r,
                    hintText: 'enter your New password',
                    fillColor: AppColor.primaryColor.withOpacity(.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
