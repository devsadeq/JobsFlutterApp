import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/choices/Position_out_dto.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/job_repository.dart';
import '../../../data/remote/repositories/position_repository.dart';
import '../../../di/locator.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final _jobRepository = getIt.get<JobRepository>();
  final _positionRepository = getIt.get<PositionRepository>();
  final _homeScrollController = ScrollController();

  ScrollController get homeScrollController => _homeScrollController;

  final RxInt _indicatorIndex = 0.obs;

  int get indicatorIndex => _indicatorIndex.value;

  final RxInt _selectedChipIndex = 0.obs;

  int get selectedChipIndex => _selectedChipIndex.value;

  final Rx<Status<List<JobOutDto>>> _rxJobs =
      Rx<Status<List<JobOutDto>>>(const Status.loading());

  Status<List<JobOutDto>> get rxJobs => _rxJobs.value;

  final Rx<Status<List<PositionOutDto>>> _rxPositions =
      Rx<Status<List<PositionOutDto>>>(const Status.loading());

  Status<List<PositionOutDto>> get rxPositions => _rxPositions.value;

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
    _selectedChipIndex.value = index;
  }

  updateIndicatorValue(newIndex, _) {
    _indicatorIndex.value = newIndex;
  }

  Future<void> getJobs() async {
    final Status<List<JobOutDto>> state = await _jobRepository.getAll();
    _rxJobs.value = state;
  }

  Future<void> getPositions() async {
    final Status<List<PositionOutDto>> state =
        await _positionRepository.getAll();
    _rxPositions.value = state;
  }

  Future<void> onRefresh() async {
    getPositions();
    getJobs();
  }

  void animateToStart(){
    _homeScrollController.animateTo(0.0, duration: const Duration(seconds: 1), curve: Curves.easeOut);
  }
}
