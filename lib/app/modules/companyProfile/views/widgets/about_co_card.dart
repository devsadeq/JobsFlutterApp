import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

class AboutTheCompany extends StatelessWidget {
  const AboutTheCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.h,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r), color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 21.h, bottom: 5.h),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.circleUser,
                    size: 24, color: Color(0xffFF9228)),
                SizedBox(width: 12.w),
                Text(
                  AppStrings.abtco,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 0.5,
            endIndent: 20,
            indent: 20,
          ),
          Text(
            AppStrings.AboutTheCompanyText,
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
