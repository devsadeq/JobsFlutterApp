import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomingMsg extends StatelessWidget {
  const WelcomingMsg({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff14171A),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          subTitle,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff657786),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
