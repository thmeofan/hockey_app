import 'package:flutter/material.dart';

import '../app_colors.dart';

class NewsTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle preview = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 10.0,
    fontWeight: FontWeight.w300,
    color: AppColors.lightGreyColor,
  );
  static const TextStyle date = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightBlueColor,
  );
  static const TextStyle articleTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle articleText = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );
}
