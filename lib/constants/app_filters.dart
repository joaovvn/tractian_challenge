import 'package:flutter/material.dart';
import 'package:tractian_challenge/constants/app_images.dart';
import 'package:tractian_challenge/constants/app_status.dart';
import 'package:tractian_challenge/constants/app_texts.dart';

class AppFilters {
  static const int none = -1;
  static const int energyFilter = 0;
  static const int criticalFilter = 1;
  static const int vibrationFilter = 2;
  static const int operatingFilter = 3;

  // Returns label for each filter
  static String getFilterLabel(int id) {
    switch (id) {
      case energyFilter:
        return AppTexts.energySensor;
      case criticalFilter:
        return AppTexts.critical;
      case vibrationFilter:
        return AppTexts.vibrationSensor;
      case operatingFilter:
        return AppTexts.operating;
      default:
        return "";
    }
  }

  // Returns label for each filter
  static String getFilterType(int id) {
    switch (id) {
      case energyFilter:
        return "energy";
      case criticalFilter:
        return AppStatus.critical;
      case vibrationFilter:
        return "vibration";
      case operatingFilter:
        return AppStatus.operating;
      default:
        return "";
    }
  }

  // Returns icons for each filter
  static Widget getFilterIcon(int id, Color color) {
    switch (id) {
      case energyFilter:
        return Image.asset(
          AppImages.energy,
          height: 24,
          color: color,
        );
      case criticalFilter:
        return Image.asset(
          AppImages.critical,
          height: 24,
          color: color,
        );
      case vibrationFilter:
        return Image.asset(
          AppImages.vibration,
          height: 24,
          color: color,
        );
      case operatingFilter:
        return Image.asset(
          AppImages.operating,
          height: 24,
          color: color,
        );
      default:
        return const Icon(Icons.question_mark);
    }
  }
}
