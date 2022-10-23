import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../widgets/custom_info_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String? description;

  @override
  Widget build(BuildContext context) {
    return description == null
        ? const SizedBox()
        : CustomInfoCard(
            icon: HeroIcons.userCircle,
            title: "About me",
            body: Text(
              description!,
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          );
  }
}
