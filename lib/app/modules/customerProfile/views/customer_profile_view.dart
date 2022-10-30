import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/customer_profile_controller.dart';
import 'widgets/body.dart';

class CustomerProfileView extends GetView<CustomerProfileController> {
  const CustomerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Get.theme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: const SafeArea(child: Body()),
    );
  }
}
