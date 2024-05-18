import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_images.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/settings/settings_navigator.dart';
import 'package:chatty/features/settings/settings_vm.dart';
import 'package:chatty/features/settings/widgets/delete_account_dialog.dart';
import 'package:chatty/features/settings/widgets/edit_password_dialog.dart';
import 'package:chatty/features/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseView<SettingsScreen, SettingsViewModel>
    implements SettingsNavigator {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          elevation: 0,
        ),
        backgroundColor: AppColor.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Settings',
                style: AppStyles.bodyL,
              ),
              SizedBox(height: 4.h),
              Text('Edit your personal data', style: AppStyles.bodyS),
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
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                  child: SingleChildScrollView(
                    child: ChangeNotifierProvider(
                      create: (context) => viewModel,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppImages.settings,
                              width: 200.w,
                              height: 160.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          SettingsWidget(
                            text: AppStrings.editName,
                            onPressed: () {},
                          ),
                          Divider(color: AppColor.second.withOpacity(.8)),
                          SettingsWidget(
                            text: AppStrings.editEmail,
                            onPressed: () {},
                          ),
                          Divider(color: AppColor.second.withOpacity(.8)),
                          SettingsWidget(
                            text: AppStrings.editPassword,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return EditPasswordDialog(
                                    currentPasswordController:
                                        currentPasswordController,
                                    newPasswordController:
                                        newPasswordController,
                                    onChangeTapped: () async {
                                      await viewModel.updatePassword(
                                          newPasswordController.text);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          Divider(color: AppColor.second.withOpacity(.8)),
                          SettingsWidget(
                            text: AppStrings.aboutUs,
                            onPressed: () {},
                          ),
                          Divider(color: AppColor.second.withOpacity(.8)),
                          SettingsWidget(
                            text: AppStrings.privacy,
                            onPressed: () {},
                          ),
                          Divider(color: AppColor.second.withOpacity(.8)),
                          SettingsWidget(
                            text: AppStrings.deleteAccount,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteAccountDialog(
                                    onDeleteTapped: () {
                                      viewModel.deleteAccount();
                                    },
                                  );
                                },
                              );
                            },
                          ),
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
  initViewModel() {
    return SettingsViewModel();
  }

  @override
  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutesName.login, (route) => false);
  }

  @override
  void goToAuth() {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutesName.auth, (route) => false);
  }
}
