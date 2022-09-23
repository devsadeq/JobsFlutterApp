import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/values/strings.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( top: 20.h, left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          IconButton(onPressed: (){},
              icon: FaIcon(
                  FontAwesomeIcons.chevronLeft
              )
          ),
          Row(
            children: [
              SizedBox(width: 110.w),

              CircleAvatar(
                radius: 52.w,
                backgroundImage:  NetworkImage(
                  "https://www.brightindialed.com/logos-a-Amazon",
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 90.w , top: 10.h, bottom: 5.h),
            child: Column(
              children: [
                Text("Amazone",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    )
                ),

                SizedBox(height: 5.h,),

            Text(AppStrings.CompanysField,
            style:GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff95969D)),
            ),

            SizedBox(height: 5.h,),

            Text(AppStrings.Email,
              style:GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff95969D)),
            ),
                SizedBox(height: 29.h,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(

                  style:ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 40.w)
                     ),
                  onPressed: () {  },
                  child: Text(AppStrings.aboutUs,
                    style:GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                    ) ,),
                ),

                SizedBox(width: 20.w,),

                ElevatedButton(

                  style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 54.w),
                      backgroundColor: Color(0xffE5E5E5)),

                  onPressed: () {  },
                  child: Text(AppStrings.jobs,
                    style:GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ) ,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


