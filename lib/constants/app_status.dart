import 'package:flutter/material.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/app_images.dart';
import 'package:tractian_challenge/constants/app_sizes.dart';

class AppStatus {
  static const String operating = "operating";
  static const String critical = "alert";

  static Widget getIcon(String status) {
    switch (status) {
      case operating:
        return Image.asset(
          AppImages.operating,
          color: AppColors.operating,
          height: AppSizes.mediumIconSize,
        );
      case critical:
        return Image.asset(
          AppImages.critical,
          color: AppColors.critical,
          height: AppSizes.mediumIconSize,
        );
      default:
        return const Icon(
          Icons.question_mark,
        );
    }
  }
}
