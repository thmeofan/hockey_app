import 'package:flutter/material.dart';

import '../app_colors.dart';

class NewsTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static const TextStyle preview = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10.0,
    fontWeight: FontWeight.w300,
    color: AppColors.lightGreyColor,
  );
  static const TextStyle date = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10.0,
    fontWeight: FontWeight.w300,
    color: AppColors.lightBlueColor,
  );
  static const TextStyle articleTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle articleText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );
}
