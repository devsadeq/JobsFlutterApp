import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/root/controllers/root_controller.dart';

class SavedController extends GetxController {
  final rootController = Get.find<RootController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  jumpToHome() {
    rootController.persistentTabController.jumpToTab(0);
  }
}
