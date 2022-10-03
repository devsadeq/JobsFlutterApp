import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs_flutter_app/app/di/locator.dart';
import 'package:jobs_flutter_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/login/login_view.dart';
import 'package:jobs_flutter_app/app/modules/root/views/root_view.dart';

import 'app/core/theme/app_theme.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  setupLocator();
  await GetStorage.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        home: Obx(
          () => AuthController.to.isLoggedIn
              ? const RootView()
              : const LoginView(),
        ),
        getPages: AppPages.routes,
        theme: AppTheme.lightTheme,
      ),
    ),
  );
}
