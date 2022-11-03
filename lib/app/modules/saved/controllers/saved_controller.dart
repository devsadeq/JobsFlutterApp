import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';

import '../../../data/remote/api/api_routes.dart';
import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/job/job_out_dto.dart';
import '../../../data/remote/repositories/customer/customer_repository.dart';
import '../../../di/locator.dart';
import '../../../widgets/custom_job_card.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../root/controllers/root_controller.dart';

class SavedController extends GetxController {
  static SavedController get to => Get.find();
  final _customerRepository = getIt.get<CustomerRepository>();
  final _rootController = Get.find<RootController>();
  final _authController = AuthController.to;
  final _savedScrollController = ScrollController();
  final animatedListKey = GlobalKey<AnimatedListState>();

  ScrollController get savedScrollController => _savedScrollController;

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

  Future<void> jumpToHome() async {
    _rootController.persistentTabController.jumpToTab(0);
  }

  Future<void> getSavedJobs() async {
    _rxSavedJobs.value = const Status.loading();
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
    final savedList = (savedJobs as Success).data!;
    if (result != null) {
      removeSavedJobFromAnimatedList(
        savedList.indexWhere((job) => job.id == jobUuid),
      );
      if (savedList.isEmpty) getSavedJobs();
      HomeController.to.getFeaturedJobs();
      HomeController.to.getRecentJobs();
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

  void animateToStart() {
    _savedScrollController.animateTo(0.0,
        duration: const Duration(seconds: 1), curve: Curves.easeOut);
  }

  void onRetry() {
    getSavedJobs();
  }

  void removeSavedJobFromAnimatedList(int index) {
    final item = (savedJobs as Success).data![index];
    (savedJobs as Success).data!.removeAt(index);
    animatedListKey.currentState!.removeItem(index, (context, animation) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: CustomJobCard(
          avatar: "${ApiRoutes.BASE_URL}${item.company!.image}",
          companyName: item.company!.name!,
          employmentType: item.employmentType,
          jobPosition: item.position,
          location: item.location,
          actionIcon: HeroIcons.bookmark,
          publishTime: item.createdAt!,
          workplace: item.workplace,
          description: item.description,
        ),
      );
    });
  }
}
