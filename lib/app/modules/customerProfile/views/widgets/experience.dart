import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../data/remote/dto/customer/customer_profile_out_dto.dart';
import '../../../../utils/extensions.dart';
import '../../../../widgets/custom_info_card.dart';

class Experience extends StatelessWidget {
  const Experience({
    Key? key,
    required this.experience,
  }) : super(key: key);
  final List<WorkExperience>? experience;

  @override
  Widget build(BuildContext context) {
    return experience == null || experience!.isEmpty
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.briefcase,
            title: "Work experience",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                experience!.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience![index].title!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      experience![index].companyWorkedFor!,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "${experience![index].startDate!.toShortDate()} - ${experience![index].endDate!.toShortDate()}",
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Get.theme.colorScheme.secondary,
                      ),
                    ),
                    if (index != experience!.length - 1)
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
