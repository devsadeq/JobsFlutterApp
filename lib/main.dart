import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/theme/app_theme.dart';
import 'app/di/locator.dart';
import 'app/modules/auth/bindings/auth_binding.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/modules/auth/views/login/login_view.dart';
import 'app/modules/root/views/root_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  setupLocator();
  await GetStorage.init();
  await CountryCodes.init();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => ScreenUtilInit(
    //     designSize: const Size(375, 812),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (_, child) => GetMaterialApp(
    //       locale: Get.locale,
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: AuthBinding(),
    //       home: Obx(
    //         () => AuthController.to.currentUser != null
    //             ? const RootView()
    //             : const LoginView(),
    //       ),
    //       getPages: AppPages.routes,
    //       theme: AppTheme.lightTheme,
    //       defaultTransition: Transition.cupertino,
    //       useInheritedMediaQuery: true,
    //       builder: DevicePreview.appBuilder,
    //     ),
    //   ),
    // ),

    /*
    * Without DevicePreview
    * */
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        locale: Get.locale,
        debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        home: Obx(
          () => AuthController.to.currentUser != null
              ? const RootView()
              : const LoginView(),
        ),
        getPages: AppPages.routes,
        theme: AppTheme.lightTheme,
        defaultTransition: Transition.cupertino,
      ),
    ),
  );
}
