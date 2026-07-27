import 'package:flutter/material.dart';
import 'package:task/core/resources/app_colors.dart';

abstract final class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle characterName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle body = TextStyle(fontSize: 14, color: AppColors.grey);

  static const TextStyle status = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
