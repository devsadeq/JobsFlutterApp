import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/home/controllers/home_controller.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/customer/customer_repository.dart';
import '../../../di/locator.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../root/controllers/root_controller.dart';

class SavedController extends GetxController {
  static SavedController get to => Get.find();
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

  bool isJobSaved(String jobUuid) {
    final result = savedJobs.whenOrNull(
        success: (data) => data?.firstWhereOrNull((job) => job.id == jobUuid));
    return result != null ? true : false;
  }

  Future<bool?> onSaveButtonTapped(bool isSaved, String jobUuid) async {
    final result = await onSaveStateChange(isSaved, jobUuid);
    if (result != null) {
      HomeController.to.getFeaturedJobs();
    }
    return result;
  }

  Future<bool?> onSaveStateChange(bool isSaved, String jobUuid) async {
    final result = await _customerRepository.toggleSave(
      customerUuid: _authController.currentUser!.id!,
      jobUuid: jobUuid,
    );
    final saved = result.whenOrNull(success: (data) => data!.saved);
    return saved;
  }
}
