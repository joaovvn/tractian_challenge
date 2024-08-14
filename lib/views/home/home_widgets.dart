import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/app_images.dart';
import 'package:tractian_challenge/constants/app_sizes.dart';
import 'package:tractian_challenge/controllers/home/home_controller.dart';
import 'package:tractian_challenge/models/company_model.dart';
import 'package:tractian_challenge/views/assets/assets_page.dart';

Widget companyCard(Company company) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius)),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Row(
          children: [
            Image.asset(
              AppImages.unit,
              color: AppColors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.paddingMedium),
              child: Text(
                "${company.name} Unit",
                style: const TextStyle(
                    color: AppColors.white, fontSize: AppSizes.bodyTextSize),
              ),
            )
          ],
        ),
      ),
    ),
    onTap: () => Get.to(() => AssetsPage(
          companyId: company.id,
        )),
  );
}

Widget companyCardShimmer() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSizes.mediumRadius)),
    child: Padding(
      padding: const EdgeInsets.all(AppSizes.paddingLarge),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.mainColor.withOpacity(0.8),
            highlightColor: AppColors.mainColor.withOpacity(0.1),
            child: Image.asset(
              AppImages.unit,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.paddingMedium),
            child: Shimmer.fromColors(
                baseColor: AppColors.mainColor.withOpacity(0.8),
                highlightColor: AppColors.mainColor.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.smallRadius),
                    color: AppColors.white,
                  ),
                  height: AppSizes.bodyTextSize,
                  width: AppSizes.dummyText,
                )),
          )
        ],
      ),
    ),
  );
}

Widget companySelector(HomeController controller) {
  RxList<Company> companies = controller.companies;
  return Obx(() => controller.isLoading.value
      ? ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingLarge),
          separatorBuilder: (context, index) => const SizedBox(
                height: AppSizes.separator,
              ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return companyCardShimmer();
          })
      : ListView.separated(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingLarge),
          separatorBuilder: (context, index) => const SizedBox(
                height: AppSizes.separator,
              ),
          itemCount: companies.length,
          itemBuilder: (context, index) {
            return companyCard(companies[index]);
          }));
}
