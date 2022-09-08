import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/custom_text_field.dart';

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextField(
            title: "Full name",
            hintText: "Sadeq S. Mhana",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Phone number",
            hintText: "+9647712345678",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            title: "Email",
            hintText: "example@example.com",
            autofocus: false,
            maxLines: 1,
            isRequired: true,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15.h),
          const CustomTextField(
            hintText: "Password",
            title: "Password",
            autofocus: false,
            isPassword: true,
            isVisible: false,
            isRequired: true,
          ),
        ],
      ),
    );
  }
}
