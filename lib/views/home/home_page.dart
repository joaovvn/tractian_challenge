import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/constants/widgets/app_bar.dart';
import 'package:tractian_challenge/controllers/home/home_controller.dart';
import 'package:tractian_challenge/views/home/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.init();
    return Scaffold(
      appBar: homeAppBar(),
      body: companySelector(controller),
    );
  }
}
