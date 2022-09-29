import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/base/irepository.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/job_repository.dart';
import 'package:jobs_flutter_app/app/di/locator.dart';

class JobDetailsController extends GetxController {
  final String uuid = Get.arguments;
  final IRepository _jobRepository = getIt.get<JobRepository>();

  final Rx<State<JobOutDto>> _rxJob =
      Rx<State<JobOutDto>>(const State.loading());

  State<JobOutDto> get rxJob => _rxJob.value;

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
    final State<JobOutDto> state =
        await _jobRepository.get(uuid: uuid) as State<JobOutDto>;
    _rxJob.value = state;
  }
}
