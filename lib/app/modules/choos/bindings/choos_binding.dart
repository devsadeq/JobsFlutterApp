import 'package:get/get.dart';

import '../controllers/choos_controller.dart';

class ChoosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoosController>(
      () => ChoosController(),
    );
  }
}
