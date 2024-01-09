import 'package:flutter/material.dart';

import '../app_colors.dart';

class MatchTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 10.0,
    height: 12 / 10,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGreyColor,
  );

  static const TextStyle team = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 12.0,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle score = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 14.0,
    height: 17 / 14,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
}
