import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/models/room_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.items,
});
  final List<RoomCategoryModel> items;
  final RoomCategoryModel? value;
  final Function(RoomCategoryModel?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.primaryColor.withOpacity(.1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<RoomCategoryModel>(
          isExpanded: true,
          iconEnabledColor: AppColor.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
          iconDisabledColor: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
          dropdownColor: AppColor.whiteColor,
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<RoomCategoryModel>(
                  value: e,
                  child: Row(
                    children: [
                      e.roomIcon,
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(e.roomName)
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged:
            onChanged
        ),
      ),
    );
  }
}
