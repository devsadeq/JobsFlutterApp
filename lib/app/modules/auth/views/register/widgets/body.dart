import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/domain/enums/user_type.dart';
import 'package:jobs_flutter_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/register/widgets/employer_form.dart';

import '../../../../../core/values/strings.dart';
import '../../widgets/button_with_text.dart';
import '../../widgets/welcoming_msg.dart';
import '../../../../../routes/app_pages.dart';
import 'employee_form.dart';

class Body extends GetView<AuthController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userType = Get.arguments;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => controller.registerCustomerState.when(
            idle: () => Column(
              children: [
                SizedBox(height: 50.h),
                const WelcomingMsg(
                  title: AppStrings.createAnAccount,
                  subTitle: AppStrings.registerSubtitle,
                ),
                SizedBox(height: 48.h),
                if (userType == UserType.CUSTOMER) const EmployeeForm(),
                if (userType == UserType.COMPANY) const EmployerForm(),
                SizedBox(height: 50.h),
                ButtonWithText(
                  btnLabel: AppStrings.signup.toUpperCase(),
                  firstTextSpan: AppStrings.alreadyHaveAnAccount,
                  secondTextSpan: AppStrings.signIn,
                  onTap: () => controller.onRegisterSubmit(userType),
                  onTextTap: () => Get.offNamed(Routes.LOGIN),
                ),
                SizedBox(height: 50.h),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              Future.delayed(Duration.zero, () {
                Get.offAllNamed(Routes.ROOT);
              });
              return Container();
            },
            failure: (e) => Text(e!),
          ),
        ),
      ),
    );
  }
}
