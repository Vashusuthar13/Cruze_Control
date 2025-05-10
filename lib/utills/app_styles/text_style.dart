import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:flutter/material.dart';


class AppTextStyles {


  static  TextStyle heading = TextStyle(
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: AppColors.mainWhite,
  );

  static  TextStyle subheading = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.mainWhite,
  );

  static  TextStyle body = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    color: AppColors.lightGrey,
  );

  static  TextStyle highlight = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.mainYellow,
  );

  static  TextStyle small = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    fontFamily: 'Inter',
    color: AppColors.lightGrey,
  );
}