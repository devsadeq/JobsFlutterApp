import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../home/views/widgets/custom_job_card.dart';


class SavedJobs extends StatelessWidget {
  const SavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Text('Saved Jobs' , style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700
        )),
        SizedBox(height: 30.h),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 22.h),
            child: const CustomJobCard(),
          ),
        )
      ],
    );
  }
}
