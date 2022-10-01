import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/core/values/strings.dart';
import 'package:jobs_flutter_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jobs_flutter_app/app/routes/app_pages.dart';

import '../../widgets/button_with_text.dart';
import 'login_form.dart';
import '../../widgets/welcoming_msg.dart';

class Body extends GetView<AuthController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Obx(
        () => controller.loginState.when(
          idle: () => Column(
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
                onTap: () => controller.login(),
                onTextTap: () => Get.toNamed(Routes.CHOOSE),
              ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (date) {
            Future.delayed(Duration.zero, () {
              Get.offAllNamed(Routes.ROOT);
            });
            return Container();
          },
          failure: (e) => Center(child: Text(e!)),
        ),
      ),
    );
  }
}
