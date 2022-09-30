import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/choices/Position_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/job_repository.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/position_repository.dart';
import 'package:jobs_flutter_app/app/di/locator.dart';

import '../../root/controllers/root_controller.dart';

class HomeController extends GetxController {
  final _jobRepository = getIt.get<JobRepository>();
  final _positionRepository = getIt.get<PositionRepository>();
  final _rootController = Get.find<RootController>();

  final RxInt _indicatorIndex = 0.obs;

  int get indicatorIndex => _indicatorIndex.value;

  final RxInt _selectedChipIndex = 0.obs;

  int get selectedChipIndex => _selectedChipIndex.value;

  final Rx<State<List<JobOutDto>>> _rxJobs =
      Rx<State<List<JobOutDto>>>(const State.loading());

  State<List<JobOutDto>> get rxJobs => _rxJobs.value;

  final Rx<State<List<PositionOutDto>>> _rxPositions =
      Rx<State<List<PositionOutDto>>>(const State.loading());

  State<List<PositionOutDto>> get rxPositions => _rxPositions.value;

  @override
  void onInit() {
    super.onInit();
    getJobs();
    getPositions();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateSelectedChipIndex(int index) {
    Get.printInfo(info: index.toString());
    print("new index $index");
    _selectedChipIndex.value = index;
    print("selected $selectedChipIndex");
  }

  updateIndicatorValue(newIndex, _) {
    _indicatorIndex.value = newIndex;
  }

  Future<void> getJobs() async {
    final State<List<JobOutDto>> state = await _jobRepository.getAll();
    _rxJobs.value = state;
  }

  Future<void> getPositions() async {
    final State<List<PositionOutDto>> state =
        await _positionRepository.getAll();
    _rxPositions.value = state;
  }

  Future<void> onRefresh() async {
    getPositions();
    getJobs();
  }

  void toggleDrawer() {
    _rootController.toggleDrawer();
  }
}
