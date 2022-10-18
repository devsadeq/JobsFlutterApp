import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jobs_flutter_app/app/modules/saved/controllers/saved_controller.dart';
import 'package:jobs_flutter_app/app/modules/search/controllers/search_controller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../widgets/dialogs.dart';
import '../../home/controllers/home_controller.dart';

class RootController extends GetxController {
  static RootController get to => Get.find();
  final persistentTabController = PersistentTabController(initialIndex: 0);
  final zoomDrawerController = ZoomDrawerController();

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

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
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
