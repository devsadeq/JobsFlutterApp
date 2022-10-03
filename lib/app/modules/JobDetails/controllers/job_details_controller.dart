import 'package:get/get.dart';

import '../../../data/remote/base/irepository.dart';
import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/job_repository.dart';
import '../../../di/locator.dart';

class JobDetailsController extends GetxController {
  final String uuid = Get.arguments;
  final IRepository _jobRepository = getIt.get<JobRepository>();

  final Rx<Status<JobOutDto>> _rxJob =
      Rx<Status<JobOutDto>>(const Status.loading());

  Status<JobOutDto> get rxJob => _rxJob.value;

  @override
  void onInit() {
    super.onInit();
    getJobDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getJobDetails() async {
    final Status<JobOutDto> state =
        await _jobRepository.get(uuid: uuid) as Status<JobOutDto>;
    _rxJob.value = state;
  }
}
