import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/customer/customer_repository.dart';
import '../../../di/locator.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../root/controllers/root_controller.dart';

class SavedController extends GetxController {
  final _customerRepository = getIt.get<CustomerRepository>();
  final _rootController = Get.find<RootController>();
  final _authController = AuthController.to;

  final Rx<Status<List<JobOutDto>>> _rxSavedJobs =
      Rx<Status<List<JobOutDto>>>(const Status.idle());

  Status<List<JobOutDto>> get savedJobs => _rxSavedJobs.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getSavedJobs();
  }

  @override
  void onClose() {
    super.onClose();
  }

  jumpToHome() {
    _rootController.persistentTabController.jumpToTab(0);
  }

  Future<void> getSavedJobs() async {
    final result = await _customerRepository.getAllSavedJobs(
        customerUuid: _authController.currentUser!.id!);

    _rxSavedJobs.value = result;
  }
}
