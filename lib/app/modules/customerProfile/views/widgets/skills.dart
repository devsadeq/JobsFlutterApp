import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
    required this.skills,
  }) : super(key: key);
  final List<String>? skills;

  @override
  Widget build(BuildContext context) {
    return skills == null
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "Skills",
            body: Wrap(
              children: List.generate(
                skills!.length,
                (index) => Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      skills![index],
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
