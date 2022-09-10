import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/register/widgets/emoployer_form.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/widgets/button_with_text.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/widgets/welcoming_msg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            const WelcomingMsg(
              title: AppStrings.createAnAccount,
              subTitle: AppStrings.registerSubtitle,
            ),
            SizedBox(height: 48.h),
            const EmployerForm(),
            SizedBox(height: 50.h),
            ButtonWithText(
              btnLabel: AppStrings.signup.toUpperCase(),
              firstTextSpan: AppStrings.alreadyHaveAnAccount,
              secondTextSpan: AppStrings.signIn,
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
