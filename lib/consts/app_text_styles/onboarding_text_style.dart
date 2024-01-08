import 'package:flutter/material.dart';

import '../app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    height: 24.0 / 22.0,
    color: AppColors.whiteColor,
  );
  static const TextStyle description = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 14.0 / 11.0,
    color: AppColors.whiteColor,
  );
  static const TextStyle screenTitle = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    height: 24.0 / 20.0,
    color: AppColors.whiteColor,
  );
}
