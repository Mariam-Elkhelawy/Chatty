import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/constants.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/signup/signup_navigator.dart';
import 'package:chatty/features/signup/signup_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseView<SignUpScreen, SignUpViewModel>
    implements SignUpNavigator {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 125.h),
              Text(
                AppStrings.start,
                style: AppStyles.bodyL,
              ),
              SizedBox(height: 4.h),
              Text(AppStrings.createNew, style: AppStyles.bodyS),
              SizedBox(height: 50.h),
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
                    child: ChangeNotifierProvider(
                      create: (context) => viewModel,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.signup,
                            style: AppStyles.textButton.copyWith(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            AppStrings.fullName,
                            style:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 6.h),
                          customTextFormField(
                            controller: nameController,
                            borderColor: AppColor.primaryColor.withOpacity(.05),
                            hintText: AppStrings.fullNameHint,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 10.h),
                            textStyle:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                            radius: 10.r,
                            onValidate: (value) {
                              if (value!.trim().isEmpty) {
                                return AppStrings.nameValidate;
                              }
                              return null;
                            },
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
                              borderColor:
                                  AppColor.primaryColor.withOpacity(.05),
                              hintText: AppStrings.emailHint,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 10.h),
                              textStyle: AppStyles.generalText
                                  .copyWith(fontSize: 16.sp),
                              radius: 10.r,
                              onValidate: (value) {
                                if (value!.trim().isEmpty) {
                                  return AppStrings.emailValidate;
                                }
                                bool emailValid =
                                    RegExp(Constants.emailReg).hasMatch(value);
                                if (!emailValid) {
                                  return AppStrings.emailValidate2;
                                }
                                return null;
                              }),
                          SizedBox(height: 20.h),
                          Text(
                            AppStrings.mobile,
                            style:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 6.h),
                          customTextFormField(
                              controller: phoneController,keyboardType: TextInputType.phone,
                              borderColor:
                                  AppColor.primaryColor.withOpacity(.05),
                              hintText: AppStrings.mobileHint,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 10.h),
                              textStyle: AppStyles.generalText
                                  .copyWith(fontSize: 16.sp),
                              radius: 10.r,
                              onValidate: (value) {
                                if (value!.trim().isEmpty) {
                                  return AppStrings.phoneValidate;
                                }
                                RegExp regex = RegExp(Constants.phoneReg);
                                if (!regex.hasMatch(value)) {
                                  return AppStrings.phoneValidate2;
                                }
                                return null;
                              }),
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
                              if (value!.trim().isEmpty) {
                                return AppStrings.passwordValidate;
                              }
                              RegExp regex = RegExp(Constants.passwordReg);
                              if (!regex.hasMatch(value)) {
                                return AppStrings.passwordValidate2;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 50.h),
                          InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                viewModel.createAccount(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: customButton(
                              color: AppColor.primaryColor,
                              borderColor: AppColor.primaryColor,
                              height: 60.h,
                              width: 360.w,
                              borderRadius: BorderRadius.circular(15.r),
                              child: Text(
                                AppStrings.create,
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
                                    AppRoutesName.login, (route) => false);
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppStrings.haveAccount,
                                      style: AppStyles.generalText
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    TextSpan(
                                      text: AppStrings.login,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignUpViewModel initViewModel() {
    return SignUpViewModel();
  }
}
