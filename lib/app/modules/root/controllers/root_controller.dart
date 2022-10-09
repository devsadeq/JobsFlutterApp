import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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

  void onHomeDoubleClick(){
    HomeController.to.animateToStart();
  }
}
