import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.hint,
  );

  static const label = TextStyle(
    fontSize: 14,
    color: AppColors.white,
  );

  static const link = TextStyle(
    fontSize: 13,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );
}
