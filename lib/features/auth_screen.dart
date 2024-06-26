import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_images.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Image.asset(AppImages.authVector),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                    SizedBox(height: 45.h),
                    Text(
                      AppStrings.connect,
                      style: AppStyles.textButton,
                    ),
                    SizedBox(height: 25.h),
                    Text(AppStrings.chattyIntro, style: AppStyles.bodyS,textAlign: TextAlign.center,),
                    SizedBox(height: 90.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutesName.login, (route) => false);
                      },
                      child: customButton(
                        borderColor: AppColor.whiteColor,
                        height: 60.h,
                        width: 360.w,
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColor.whiteColor,
                        child: Text(
                          AppStrings.login,
                          style: AppStyles.textButton
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutesName.signup, (route) => false);
                      },
                      child: customButton(
                        borderColor: AppColor.whiteColor,
                        height: 60.h,
                        width: 360.w,
                        borderRadius: BorderRadius.circular(15.r),
                        child: Text(
                          AppStrings.signup,
                          style: AppStyles.textButton,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
