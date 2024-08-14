import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/app_colors.dart';
import 'package:tractian_challenge/constants/widgets/app_bar.dart';
import 'package:tractian_challenge/controllers/assets/assets_controller.dart';
import 'package:tractian_challenge/views/assets/assets_widgets.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context) {
    final AssetsController controller = Get.put(AssetsController());
    controller.init(companyId);
    return Scaffold(
      appBar: assetsAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(controller),
            filters(controller),
            const Divider(
              color: AppColors.gray,
            ),
            locationAssetTree(controller, controller.nodes)
          ],
        ),
      ),
    );
  }
}
