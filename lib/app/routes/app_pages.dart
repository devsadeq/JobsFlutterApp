import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/auth/views/register/register_view.dart';
import 'package:jobs_flutter_app/app/modules/choos/bindings/choos_binding.dart';
import 'package:jobs_flutter_app/app/modules/choos/views/choos_view.dart';
import 'package:jobs_flutter_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:jobs_flutter_app/app/modules/splash/views/splash_view.dart';
import 'package:jobs_flutter_app/app/modules/waiting/bindings/waiting_binding.dart';
import 'package:jobs_flutter_app/app/modules/waiting/views/waiting_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login/login_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE,
      page: () => const ChoosView(),
      binding: ChoosBinding(),
    ),
    GetPage(
      name: _Paths.WAITTING,
      page: () => const WaitingView(),
      binding: WaitingBinding(),
    ),
  ];
}
