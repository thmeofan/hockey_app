import 'package:flutter/material.dart';

import '../app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    height: 28.0 / 22.0,
    color: AppColors.whiteColor,
  );
  static const TextStyle description = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    height: 18.0 / 11.0,
    color: AppColors.lightGreyColor,
  );
  static const TextStyle miniIntro = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 18.0 / 12.0,
    color: AppColors.lightGreyColor,
  );
}
