import 'package:get/get.dart';

import '../controllers/waiting_controller.dart';

class WaitingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingController>(
      () => WaitingController(),
    );
  }
}
