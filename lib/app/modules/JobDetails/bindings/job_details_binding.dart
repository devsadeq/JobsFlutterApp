import 'package:get/get.dart';

import '../controllers/job_details_controller.dart';

class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobDetailsController>(
      () => JobDetailsController(),
    );
  }
}
