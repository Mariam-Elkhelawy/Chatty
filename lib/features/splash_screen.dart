import 'package:chatty/config/routes/app_routes_names.dart';
import 'package:chatty/core/database/database_utils.dart';
import 'package:chatty/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      DataBaseUtils.isLoggedBefore()
          ? Navigator.pushReplacementNamed(context, AppRoutesName.home)
          : Navigator.pushReplacementNamed(context, AppRoutesName.auth);
    });
    return Image.asset(
      AppImages.splash,
      fit: BoxFit.fill,
    );
  }
}
