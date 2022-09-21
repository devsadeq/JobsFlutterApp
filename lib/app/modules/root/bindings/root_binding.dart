import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../saved/controllers/saved_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<SavedController>(() => SavedController());
  }
}
