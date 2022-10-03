import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/home/controllers/home_controller.dart';
import 'package:jobs_flutter_app/app/modules/root/controllers/root_controller.dart';
import '../../saved/controllers/saved_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<SavedController>(() => SavedController());
  }
}
