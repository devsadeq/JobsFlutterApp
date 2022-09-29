import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/home/controllers/home_controller.dart';

import '../../../../widgets/custom_chip.dart';

class ChipsList extends GetView<HomeController> {
  const ChipsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.1.sw,
      child: Obx(
        () => controller.rxPositions.when(
          idle: () => Container(),
          loading: () => const CircularProgressIndicator(),
          success: (positions) => ListView.builder(
            itemCount: positions!.length,
            padding: EdgeInsets.only(left: 16.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Obx(
              () => CustomChip(
                title: positions[index].jobTitle!,
                isActive: index == controller.selectedChipIndex,
                onPressed: () => controller.updateSelectedChipIndex(index),
              ),
            ),
          ),
          failure: (e) => Text(e!),
        ),
      ),
    );
  }
}
