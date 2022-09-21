import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/modules/companyProfile/views/widgets/profile_header.dart';
import 'about_co_card.dart';
import 'location_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        SizedBox(height: 10.h),
        //Jobs(),
        AboutTheCompany(),
        SizedBox(height: 15.h),
        LocationCard()
      ],
    );
  }
}
