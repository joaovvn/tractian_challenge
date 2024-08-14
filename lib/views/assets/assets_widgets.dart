import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/app_filters.dart';
import 'package:tractian_challenge/constants/app_sizes.dart';
import 'package:tractian_challenge/constants/app_status.dart';
import 'package:tractian_challenge/constants/app_texts.dart';
import 'package:tractian_challenge/constants/app_types.dart';
import 'package:tractian_challenge/controllers/assets/assets_controller.dart';
import 'package:tractian_challenge/models/node_model.dart';

Widget searchField(AssetsController controller) {
  return Padding(
    padding: const EdgeInsets.all(AppSizes.paddingMedium),
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(AppSizes.mediumRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
        child: TextField(
          controller: controller.filterController,
          decoration: InputDecoration(
              border: InputBorder.none,
              icon: const Icon(Icons.search),
              hintText: AppTexts.search),
          onChanged: (string) {
            controller.selectedFilter.value = AppFilters.none;
            controller.loadAssetsandLocations();
          },
        ),
      ),
    ),
  );
}

Widget filters(AssetsController controller) {
  List<int> filterList = [
    AppFilters.energyFilter,
    AppFilters.vibrationFilter,
    AppFilters.criticalFilter,
    AppFilters.operatingFilter
  ];

  return Obx(() {
    // ScrollView for when there are more filters available.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
        child: Row(
          children: filterList
              .map((filter) => filterButton(filter, controller))
              .toList(),
        ),
      ),
    );
  });
}

Widget filterButton(int filterId, AssetsController controller) {
  RxInt selectedFilter = controller.selectedFilter;
  bool isSelected = selectedFilter.value == filterId;
  Color decorationColor = isSelected ? AppColors.white : AppColors.gray;
  Color borderColor = isSelected ? AppColors.secondaryColor : AppColors.gray;
  WidgetStateProperty<Color>? backGroundColor = isSelected
      ? const WidgetStatePropertyAll(AppColors.secondaryColor)
      : null;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
    child: ElevatedButton.icon(
      onPressed: () {
        selectedFilter.value == filterId
            ? selectedFilter.value = -1
            : selectedFilter.value = filterId;
        controller.filterController.clear();
        controller.loadAssetsandLocations();
      },
      label: Text(
        AppFilters.getFilterLabel(filterId),
        style: TextStyle(color: decorationColor),
      ),
      icon: AppFilters.getFilterIcon(filterId, decorationColor),
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(AppSizes.smallRadius))),
          backgroundColor: backGroundColor),
    ),
  );
}

Widget locationAssetTree(AssetsController controller, List<NodeModel> nodes) {
  return Expanded(
    child: Obx(() {
      return controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium,
              ),
              itemCount: nodes.length,
              itemBuilder: (context, index) {
                return locationAssetCard(nodes[index], controller);
              });
    }),
  );
}

Widget locationAssetCard(NodeModel node, AssetsController controller) {
  final RxBool isExpanded = false.obs;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingExtraSmall),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (node.childrenNodes.isNotEmpty)
              Obx(() {
                return GestureDetector(
                  child: Icon(
                    isExpanded.value ? Icons.expand_more : Icons.expand_less,
                    size: AppSizes.mediumIconSize,
                  ),
                  onTap: () => isExpanded.value = !isExpanded.value,
                );
              })
            else
              const SizedBox(
                width: AppSizes.mediumIconSize,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingExtraSmall),
              child: AppTypes.getIcons(node.type),
            ),
            Text(
              node.name,
              style: const TextStyle(fontSize: AppSizes.smallTextSize),
              overflow: TextOverflow.ellipsis,
            ),
            if (node.status != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingExtraSmall),
                child: AppStatus.getIcon(node.status ?? ""),
              )
          ],
        ),
        if (node.childrenNodes.isNotEmpty)
          Obx(() {
            return AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: isExpanded.value
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: AppSizes.paddingMediumSmall),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                          color: AppColors.gray,
                        ))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppSizes.paddingMediumSmall),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: node.childrenNodes.map((childNode) {
                                return locationAssetCard(childNode, controller);
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            );
          }),
      ],
    ),
  );
}
