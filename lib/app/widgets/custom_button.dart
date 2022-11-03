import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Future<void> Function() onTap;

  final RxBool _isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isLoading.value
              ? null
              : () async {
                  _isLoading.value = true;
                  await onTap();
                  _isLoading.value = false;
                },
          style: Get.theme.elevatedButtonTheme.style,
          child: FittedBox(
            child: _isLoading.value
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(color: Colors.white),
                  )
                : Text(title),
          ),
        ),
      ),
    );
  }
}
