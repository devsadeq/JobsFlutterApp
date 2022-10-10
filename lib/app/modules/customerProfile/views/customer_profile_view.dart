import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../widgets/custom_appbar.dart';
import '../controllers/customer_profile_controller.dart';
import 'widgets/body.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const HeroIcon(HeroIcons.chevronLeft),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const HeroIcon(HeroIcons.pencilSquare))
        ],
      ),
      body: const Body(),
    );
  }
}
