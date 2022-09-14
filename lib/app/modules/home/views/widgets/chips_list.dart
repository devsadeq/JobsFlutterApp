import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/custom_chip.dart';

class ChipsList extends StatelessWidget {
  const ChipsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ["All", "Full Stack", "Web", "Mobile", "Backend"];
    return SizedBox(
      height: 0.1.sw,
      child: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.only(left: 16.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomChip(
          title: list[index],
          isActive: index == 0,
        ),
      ),
    );
  }
}
