import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomingMsg extends StatelessWidget {
  const WelcomingMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: GoogleFonts.poppins(
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff14171A),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
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
