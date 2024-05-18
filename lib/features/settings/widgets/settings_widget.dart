import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.bodyM.copyWith(color: AppColor.primaryColor),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColor.second.withOpacity(.8),
          ),
        )
      ],
    );
  }
}
