import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';

import '../../widgets/button_with_text.dart';
import 'login_form.dart';
import '../../widgets/welcoming_msg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 118.h),
          const WelcomingMsg(
            title: AppStrings.welcomeBack,
            subTitle: AppStrings.loginSubtitle,
          ),
          SizedBox(height: 93.h),
          const LoginForm(),
          SizedBox(height: 77.h),
          const ButtonWithText(
            btnLabel: AppStrings.loginBtn,
            firstTextSpan: AppStrings.youDoNotHaveAnAccountYet,
            secondTextSpan: AppStrings.signup,
          ),
        ],
      ),
    );
  }
}
