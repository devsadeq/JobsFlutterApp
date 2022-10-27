import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SliverPersistentHeaderDelegateImp extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  const SliverPersistentHeaderDelegateImp({
    required this.tabBar,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Align(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
        ),
        child: Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: tabBar,
        ),
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height * 1.5;

  @override
  double get minExtent => tabBar.preferredSize.height * 1.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
