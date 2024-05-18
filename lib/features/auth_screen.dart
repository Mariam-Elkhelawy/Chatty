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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImages.auth,
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.authVector),
              SizedBox(height: 65.h),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 170.w,
                  child: Text(
                    AppStrings.connect,
                    style: AppStyles.textButton,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppStrings.chattyIntro,
                  style: AppStyles.bodyS
                ),
              ),
              SizedBox(height: 85.h),
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
                height: 20.h,
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
          ),
        ),
      ),
    );
  }
}
