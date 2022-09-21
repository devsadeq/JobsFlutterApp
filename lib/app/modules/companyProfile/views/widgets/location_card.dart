import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.h,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: Colors.white
      ),
      child: Column(
        children: [

          Padding(
            padding:  EdgeInsets.only(left: 22.w , top: 21.h , bottom: 5.h),
            child: Row(
              children: [


                HeroIcon(HeroIcons.briefcase,
                    size: 24,
                    color: Color(0xffFF9228)),
                SizedBox(width: 12.w),

                Text(AppStrings.Location,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,

                  ),)
              ],
            ),
          ),
          Divider(
            color: Colors.black12,
            thickness: 0.5,
            endIndent: 20,
            indent: 20,
          ),

          Padding(
            padding:  EdgeInsets.only(right: 275.w , top: 10.h),
            child: Text(AppStrings.nation,
              style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only( right: 200.w, top: 6.h),
            child: Text(AppStrings.theLocation,
              style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black54

              ),
            ),
          ),

        ],
      ),
    );
  }
}
