import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';

class Languages extends StatelessWidget {
  const Languages({
    Key? key,
    required this.languages,
  }) : super(key: key);
  final List<String>? languages;

  @override
  Widget build(BuildContext context) {
    return languages == null
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "Languages",
            body: Wrap(
              children: List.generate(
                languages!.length,
                (index) => Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: Get.theme.colorScheme.background,
                    labelPadding: EdgeInsets.all(8.w),
                    label: Text(
                      languages![index],
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
