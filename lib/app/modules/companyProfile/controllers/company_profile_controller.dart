import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/base/state.dart' as base;
import 'package:jobs_flutter_app/app/data/remote/dto/company/Company_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/dto/job/job_out_dto.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/company_repository.dart';

import '../../../data/remote/repositories/job_repository.dart';
import '../../../di/locator.dart';

class CompanyProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _companyRepository = getIt.get<CompanyRepository>();
  final _jobsRepository = getIt.get<JobRepository>();

  final String uuid = Get.arguments;
  late TabController tabController;

  final Rx<base.State<CompanyOutDto>> _rxCompany =
      Rx<base.State<CompanyOutDto>>(const base.State.loading());

  base.State<CompanyOutDto> get rxCompany => _rxCompany.value;

  final Rx<base.State<List<JobOutDto>>> _rxJobs =
      Rx<base.State<List<JobOutDto>>>(const base.State.loading());

  base.State<List<JobOutDto>> get rxJobs => _rxJobs.value;

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
    base.State<CompanyOutDto> state = await _companyRepository.get(uuid: uuid);
    _rxCompany.value = state;
  }

  getCompanyJobs() async {
    final base.State<List<JobOutDto>> jobs = await _jobsRepository.getAll();
    _rxJobs.value = jobs;
  }
}
