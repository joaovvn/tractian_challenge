import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/views/home/home_page.dart';

void main() {
  runApp(const TractianChallenge());
}

class TractianChallenge extends StatelessWidget {
  const TractianChallenge({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tractian LAMS',
      home: HomePage(),
    );
  }
}
