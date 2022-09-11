import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/choose_controller.dart';

class Body extends GetView<ChooseController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 52.h),
      child: LottieBuilder.asset(
        "assets/choose_animation.json",
        height: 375.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
