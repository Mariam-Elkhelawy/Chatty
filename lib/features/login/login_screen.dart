import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 125.h,
              ),
              Text(
                AppStrings.welcome,
                style: AppStyles.bodyL,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(AppStrings.emailSignIn, style: AppStyles.bodyS),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: double.infinity,
                height: 688.5.h,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.login,
                          style: AppStyles.textButton.copyWith(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          AppStrings.email,
                          style:
                              AppStyles.generalText.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 6.h),
                        customTextFormField(
                          controller: emailController,
                          borderColor: AppColor.primaryColor.withOpacity(.05),
                          hintText: AppStrings.emailHint,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 10.h),
                          textStyle:
                              AppStyles.generalText.copyWith(fontSize: 16.sp),
                          radius: 10.r,
                          onValidate: (value) {
                            if (value == '' || value == null) {
                              return AppStrings.emailValidate;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          AppStrings.password,
                          style:
                              AppStyles.generalText.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 6.h),
                        customTextFormField(
                          controller: passwordController,
                          borderColor: AppColor.primaryColor.withOpacity(.05),
                          isPassword: true,
                          hintText: AppStrings.passwordHint,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 10.h),
                          textStyle:
                              AppStyles.generalText.copyWith(fontSize: 16.sp),
                          radius: 10.r,
                          onValidate: (value) {
                            if (value == '' || value == null) {
                              return AppStrings.passwordValidate;
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            AppStrings.forgotPassword,
                            style: AppStyles.generalText.copyWith(
                              fontSize: 14.sp,
                              color: AppColor.primaryColor.withOpacity(.7),
                            ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        InkWell(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutesName.signup, (route) => false);
                            }
                          },
                          child: customButton(
                            color: AppColor.primaryColor,
                            borderColor: AppColor.primaryColor,
                            height: 60.h,
                            width: 360.w,
                            borderRadius: BorderRadius.circular(15.r),
                            child: Text(
                              AppStrings.login,
                              style: AppStyles.textButton
                                  .copyWith(color: AppColor.whiteColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutesName.signup, (route) => false);
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.createAccount,
                                    style: AppStyles.generalText
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  TextSpan(
                                    text: AppStrings.signup,
                                    style: AppStyles.bodyM.copyWith(
                                        color: AppColor.primaryColor,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
