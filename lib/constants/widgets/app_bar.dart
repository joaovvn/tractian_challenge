import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/app_images.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/app_sizes.dart';
import 'package:tractian_challenge/constants/app_texts.dart';
import 'package:tractian_challenge/controllers/home/home_controller.dart';

AppBar homeAppBar() {
  return AppBar(
      title: Image.asset(AppImages.logo),
      backgroundColor: AppColors.mainColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.restart_alt, color: AppColors.white),
          onPressed: () {
            HomeController controller = Get.find();
            controller.loadCompanies();
          },
        )
      ]);
}

AppBar assetsAppBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
      onPressed: () {
        Get.back();
        HomeController controller = Get.find();
        controller.loadCompanies();
      },
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppTexts.assets,
          style: const TextStyle(
              height: AppSizes.bodyTextSize, color: AppColors.white),
        ),
      ],
    ),
    centerTitle: true,
    backgroundColor: AppColors.mainColor,
  );
}
