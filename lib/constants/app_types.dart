import 'package:flutter/material.dart';
import 'package:tractian_challenge/constants/app_images.dart';
import 'package:tractian_challenge/constants/app_sizes.dart';

class AppTypes {
  static const int location = 0;
  static const int asset = 1;
  static const int component = 2;

  static Image getIcons(int type) {
    switch (type) {
      case location:
        return Image.asset(
          AppImages.location,
          height: AppSizes.mediumIconSize,
        );
      case asset:
        return Image.asset(
          AppImages.asset,
          height: AppSizes.mediumIconSize,
        );
      case component:
        return Image.asset(
          AppImages.component,
          height: AppSizes.mediumIconSize,
        );
      default:
        return Image.asset(
          AppImages.location,
          height: AppSizes.mediumIconSize,
        );
    }
  }
}
