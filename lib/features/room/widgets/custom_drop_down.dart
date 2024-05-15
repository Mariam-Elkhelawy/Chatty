import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/models/room_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.items,
      required this.initialItem});
  final List<RoomCategoryModel> items;
  final String hintText;
  final RoomCategoryModel initialItem;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      closedHeaderPadding:
          EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      initialItem: initialItem,
      hintText: hintText,
      decoration: CustomDropdownDecoration(
        closedSuffixIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.primaryColor,
        ),
        expandedSuffixIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: AppColor.primaryColor,
        ),
        closedBorderRadius: BorderRadius.circular(10.r),
        expandedBorderRadius: BorderRadius.circular(10.r),
        expandedBorder: Border.all(color: AppColor.whiteColor),
        closedBorder: Border.all(color: AppColor.primaryColor.withOpacity(.1)),
        closedFillColor: AppColor.primaryColor.withOpacity(.1),
        expandedFillColor: AppColor.whiteColor,
      ),
      items: items
          .map((e) => Row(
                children: [
                  e.roomIcon,
                  SizedBox(width: 16.w,),
                  Text(e.roomName)
                ],
              ))
          .toList(),
      onChanged: (p0) {
        onChanged();
      },
    );
  }
}
