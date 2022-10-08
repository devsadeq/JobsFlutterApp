import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_chip.dart';
import '../../../../widgets/shimmer/chips_shimmer.dart';
import '../../controllers/home_controller.dart';

class ChipsList extends GetView<HomeController> {
  const ChipsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.1.sw,
      child: Obx(
        () => controller.rxPositions.when(
          idle: () => Container(),
          loading: () => const ChipsShimmer(),
          success: (positions) => ListView.builder(
            itemCount: positions!.length,
            padding: EdgeInsets.only(left: 16.w),
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
