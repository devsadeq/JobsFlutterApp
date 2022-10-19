import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_button.dart';

class DetailsBottomNavBar extends StatelessWidget {
  const DetailsBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(14.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Get.theme.colorScheme.secondary.withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 159,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: CustomButton(
        title: "Apply",
        onTap: () {},
      ),
    );
  }
}
