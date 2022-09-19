import 'package:get/get.dart';

import '../controllers/saved_controller.dart';

class SavedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedController>(
      () => SavedController(),
    );
  }
}
