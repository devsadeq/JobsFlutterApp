import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';
import 'widgets/body.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Get.toNamed(Routes.LOGIN),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.colorScheme.secondary,
        body: const Body(),
      ),
    );
  }
}
