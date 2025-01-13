import 'package:elevate_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle primaryTextStyle = const TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle secondaryTextStyle = TextStyle(
    color: AppColors.secondary.withOpacity(0.6),
    fontSize: 13,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.secondary.withOpacity(0.6),
  );

  static TextStyle subTitleTextStyle = const TextStyle(
    color: AppColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  //
  // static TextStyle font11BlueRegular = TextStyle(
  //   color: const Color(0xff004182),
  //   fontSize: 11.sp,
  //   fontWeight: FontWeight.w400,
  // );
  //
  // static TextStyle font12DarkBlueRegular = TextStyle(
  //   color: const Color(0xff06004f),
  //   fontSize: 12.sp,
  //   fontWeight: FontWeight.w400,
  // );
}
