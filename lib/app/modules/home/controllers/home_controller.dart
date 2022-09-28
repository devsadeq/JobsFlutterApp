import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/job_repository.dart';
import 'package:jobs_flutter_app/app/di/locator.dart';

class HomeController extends GetxController {
  final _jobRepository = getIt.get<JobRepository>();

  final RxInt _indicatorIndex = 0.obs;

  int get indicatorIndex => _indicatorIndex.value;

  final Rx<State<List<JobOutDto>>> _rxJobs =
      Rx<State<List<JobOutDto>>>(const State.loading());

  State<List<JobOutDto>> get rxJobs => _rxJobs.value;

  @override
  void onInit() {
    super.onInit();
    getJobs();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateIndicatorValue(newIndex, _) {
    _indicatorIndex.value = newIndex;
  }

  Future<void> getJobs() async {
    final State<List<JobOutDto>> state = await _jobRepository.getAllJobs();
    _rxJobs.value = state;
  }
}
