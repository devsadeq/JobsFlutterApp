import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/waiting_controller.dart';
import 'widgets/body.dart';

class WaitingView extends GetView<WaitingController> {
  const WaitingView({Key? key}) : super(key: key);

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
