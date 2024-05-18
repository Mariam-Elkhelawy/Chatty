import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/components/reusable_components.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/app_strings.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:chatty/features/base.dart';
import 'package:chatty/features/models/room_category_model.dart';
import 'package:chatty/features/room/add_room_navigator.dart';
import 'package:chatty/features/room/add_room_vm.dart';
import 'package:chatty/features/room/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<RoomCategoryModel> categories = RoomCategoryModel.getCategories();
  late RoomCategoryModel roomCategoryModel;
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    roomCategoryModel = categories.first;
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
              SizedBox(
                height: 125.h,
              ),
              Text(
                AppStrings.startCommunicate,
                style: AppStyles.bodyL,
              ),
              SizedBox(height: 4.h),
              Text(AppStrings.roomWelcome, style: AppStyles.bodyS),
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
                            AppStrings.createRoomN,
                            style: AppStyles.textButton.copyWith(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            AppStrings.roomName,
                            style:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 6.h),
                          customTextFormField(
                            fillColor: AppColor.primaryColor.withOpacity(.1),
                            controller: nameController,
                            borderColor: AppColor.primaryColor.withOpacity(.05),
                            hintText: AppStrings.roomNameHint,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 10.h),
                            textStyle:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                            radius: 10.r,
                            onValidate: (value) {
                              if (value == '' || value == null) {
                                return AppStrings.roomNameValidate;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            AppStrings.roomCategory,
                            style:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 6.h),
                          CustomDropDownWidget(
                              onChanged: (value) {
                                if (value == null) return;
                                roomCategoryModel = value;
                                setState(() {});
                              },
                              value: roomCategoryModel,
                              items: categories),
                          SizedBox(height: 20.h),
                          Text(
                            AppStrings.roomDescription,
                            style:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 6.h),
                          customTextFormField(
                            fillColor: AppColor.primaryColor.withOpacity(.1),
                            controller: descriptionController,
                            borderColor: AppColor.primaryColor.withOpacity(.05),
                            hintText: AppStrings.descriptionHint,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 10.h),
                            textStyle:
                                AppStyles.generalText.copyWith(fontSize: 16.sp),
                            radius: 10.r,
                            onValidate: (value) {
                              if (value == '' || value == null) {
                                return AppStrings.roomDescriptionValidate;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 50.h),
                          InkWell(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                viewModel.createRoom(
                                    roomName: nameController.text,
                                    roomDescription: descriptionController.text,
                                    catId: roomCategoryModel.id);
                              }
                            },
                            child: customButton(
                              color: AppColor.primaryColor,
                              borderColor: AppColor.primaryColor,
                              height: 60.h,
                              width: 360.w,
                              borderRadius: BorderRadius.circular(15.r),
                              child: Text(
                                AppStrings.createRoom,
                                style: AppStyles.textButton
                                    .copyWith(color: AppColor.whiteColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
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

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

  @override
  void createRoom() {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutesName.home, (route) => false);
  }
}
