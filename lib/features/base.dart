import 'package:chatty/core/utils/app_colors.dart';
import 'package:chatty/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? navigator;
}

abstract class BaseNavigator {
  void showLoading({String message});
  void hideDialog();
  void showMessage({required String message});
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;
  VM initViewModel();
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideDialog() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message = 'Loading ...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,insetPadding: EdgeInsets.all(10.r),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          title: Center(
            child: Row(
              children: [
                const CircularProgressIndicator(color: AppColor.primaryColor),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  message,
                  style: AppStyles.bodyS.copyWith(color: AppColor.primaryColor),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void showMessage({required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,insetPadding: EdgeInsets.all(10.r),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          title: Center(
            child: Text(
              message,
              style: AppStyles.bodyS.copyWith(color: AppColor.primaryColor),
            ),
          ),
        );
      },
    );
  }
}
