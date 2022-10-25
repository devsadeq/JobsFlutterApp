import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/company/Company_out_dto.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/company_repository.dart';
import '../../../data/remote/repositories/job/job_repository.dart';
import '../../../di/locator.dart';
import '../../saved/controllers/saved_controller.dart';

class CompanyProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _companyRepository = getIt.get<CompanyRepository>();
  final _jobsRepository = getIt.get<JobRepository>();

  final String uuid = Get.arguments;
  late TabController tabController;

  final Rx<Status<CompanyOutDto>> _rxCompany =
      Rx<Status<CompanyOutDto>>(const Status.loading());

  Status<CompanyOutDto> get rxCompany => _rxCompany.value;

  final Rx<Status<List<JobOutDto>>> _rxJobs =
      Rx<Status<List<JobOutDto>>>(const Status.loading());

  Status<List<JobOutDto>> get rxJobs => _rxJobs.value;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getCompany();
    getCompanyJobs();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCompany() async {
    Status<CompanyOutDto> state = await _companyRepository.get(uuid: uuid);
    _rxCompany.value = state;
  }

  getCompanyJobs() async {
    final Status<List<JobOutDto>> jobs =
        await _jobsRepository.getAll(companyId: uuid);
    _rxJobs.value = jobs;
  }

  Future<bool?> onSaveButtonTapped(bool isSaved, String jobUuid) async {
    final result = await SavedController.to.onSaveStateChange(isSaved, jobUuid);
    if (result != null) SavedController.to.getSavedJobs();
    return result;
  }

  void onRetry() {
    getCompany();
    getCompanyJobs();
  }
}
