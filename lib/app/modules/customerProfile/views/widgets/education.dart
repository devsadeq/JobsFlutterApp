import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/dto/customer/customer_profile_out_dto.dart';
import '../../../../utils/extensions.dart';
import '../../../../widgets/custom_info_card.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    Key? key,
    required this.education,
  }) : super(key: key);
  final List<Education>? education;

  @override
  Widget build(BuildContext context) {
    return education == null || education!.isEmpty
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.academicCap,
            title: "Education",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                education!.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education![index].degree!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      education![index].school!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "${education![index].startDate!.toShortDate()} - ${education![index].endDate!.toShortDate()}",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                    if (index != education!.length - 1)
                      Divider(
                        color: Get.theme.colorScheme.background,
                        thickness: 1.5,
                      ),
                  ],
                ),
              ),
            ),
          );
  }
}
