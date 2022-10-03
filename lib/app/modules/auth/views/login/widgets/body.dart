import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/values/strings.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/auth_controller.dart';
import '../../widgets/button_with_text.dart';
import '../../widgets/welcoming_msg.dart';
import 'login_form.dart';

class Body extends GetView<AuthController> {
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
          ButtonWithText(
            btnLabel: AppStrings.loginBtn,
            firstTextSpan: AppStrings.youDoNotHaveAnAccountYet,
            secondTextSpan: AppStrings.signup,
            onTap: () => controller.onLoginSubmit(),
            onTextTap: () => Get.toNamed(Routes.CHOOSE),
          ),
        ],
      ),
    );
  }
}
