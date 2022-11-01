import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../saved/controllers/saved_controller.dart';
import '../../search/controllers/search_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.put<HomeController>(HomeController());
    Get.put<SearchController>(SearchController());
    Get.put<SavedController>(SavedController());
  }
}
