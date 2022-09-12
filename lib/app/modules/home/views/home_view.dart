import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/custom_appbar.dart';
import '../controllers/home_controller.dart';
import 'widgets/body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: const CustomAppBar(),
        body: const Body(),
      ),
    );
  }
}
