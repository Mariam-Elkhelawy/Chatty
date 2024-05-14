import 'package:chatty/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle bodyL = GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
      color: AppColor.whiteColor,
      letterSpacing: -.17);
  static TextStyle bodyM = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.whiteColor,
      letterSpacing: -.17);
  static TextStyle bodyS = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.whiteColor.withOpacity(.5),
      letterSpacing: -.17);
  static TextStyle textButton = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.whiteColor,
      letterSpacing: -.17);
  static TextStyle generalText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.primaryColor,
      letterSpacing: -.17);
}
