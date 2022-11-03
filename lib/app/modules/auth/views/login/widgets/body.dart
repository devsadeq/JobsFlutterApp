import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/values/strings.dart';
import '../../../controllers/auth_controller.dart';
import '../../widgets/button_with_text.dart';
import '../../widgets/header.dart';
import 'login_form.dart';

class Body extends GetView<AuthController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Header(title: AppStrings.welcomeBack),
              SizedBox(height: 30.h),
              const LoginForm(),
              SizedBox(height: 50.h),
              ButtonWithText(
                btnLabel: AppStrings.loginBtn,
                firstTextSpan: AppStrings.youDoNotHaveAnAccountYet,
                secondTextSpan: AppStrings.signup,
                onTap: controller.onLoginSubmit,
                onTextTap: controller.onSignUp,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
