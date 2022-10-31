import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../widgets/dialogs.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../saved/controllers/saved_controller.dart';
import '../../search/controllers/search_controller.dart';

class RootController extends GetxController {
  static RootController get to => Get.find();
  final persistentTabController = PersistentTabController(initialIndex: 0);

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
    persistentTabController.dispose();
  }

  void onHomeDoubleClick() {
    HomeController.to.animateToStart();
  }

  void onSearchDoubleClick() {
    SearchController.to.clearSearch();
  }

  void onSavedDoubleClick() {
    SavedController.to.animateToStart();
  }

  void logout() {
    Dialogs.questionDialog(
      title: "Are you sure you want\nto logout?",
      btnOkText: "Yes, logout",
      btnCancelOnPress: () {},
      btnOkOnPress: AuthController.to.logout,
    );
  }
}
