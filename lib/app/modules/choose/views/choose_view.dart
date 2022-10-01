import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/choose_controller.dart';
import 'widgets/body.dart';

class ChooseView extends GetView<ChooseController> {
  const ChooseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        body: const Body(),
      ),
    );
  }
}
