import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../../../core/values/strings.dart';
import '../../../../../utils/validators.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../controllers/auth_controller.dart';

class EmployerForm extends GetView<AuthController> {
  const EmployerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.companyFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.companyNameController,
            title: AppStrings.companyName,
            hintText: AppStrings.companyNameHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            validator: Validators.name,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.companyBusinessNumberController,
            title: AppStrings.businessNumber,
            hintText: AppStrings.phoneNumberHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
            isPhoneNumber: true,
            onCountryChanged: controller.onCountryChanged,

          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.companyBusinessEmailController,
            title: AppStrings.businessEmail,
            hintText: AppStrings.emailHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.companyCountryController,
            title: AppStrings.countryLabel,
            hintText: AppStrings.countryHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            controller: controller.companyAddressController,
            title: AppStrings.companyAddress,
            hintText: AppStrings.companyAddressHint,
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.text,
            validator: Validators.address,
          ),
          SizedBox(height: 15.h),
          Obx(
            () => CustomTextField(
              controller: controller.companyPasswordController,
              hintText: AppStrings.password,
              title: AppStrings.password,
              autofocus: false,
              isPassword: true,
              isRequired: true,
              obscureText: controller.isObscure,
              onSuffixTap: controller.toggleObscurePassword,
              suffixIcon:
                  controller.isObscure ? HeroIcons.eyeSlash : HeroIcons.eye,
            ),
          ),
        ],
      ),
    );
  }
}
