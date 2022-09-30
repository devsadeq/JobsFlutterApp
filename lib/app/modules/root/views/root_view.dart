import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/home/views/home_view.dart';
import 'package:jobs_flutter_app/app/modules/saved/views/saved_view.dart';
import 'package:jobs_flutter_app/app/modules/search/views/search_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/root_controller.dart';
import 'widgets/menu_view.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (_) => SafeArea(
        child: ZoomDrawer(
          controller: _.zoomDrawerController,
          menuScreen: const MenuView(),
          mainScreen: const _MainScreen(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          menuBackgroundColor: Get.theme.colorScheme.tertiary,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
        ),
      ),
    );
  }

// final List<MenuItem> options = [
//   MenuItem(Icons.payment, 'Payments'),
//   MenuItem(Icons.favorite, 'Discounts'),
//   MenuItem(Icons.notifications, 'Notification'),
//   MenuItem(Icons.format_list_bulleted, 'Orders'),
//   MenuItem(Icons.help, 'Help'),
// ];
}

// class MenuItem {
//   String title;
//   IconData icon;
//
//   MenuItem(this.icon, this.title);
// }

class _MainScreen extends GetView<RootController> {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.persistentTabController,
      screens: _getNavBarScreens(),
      items: _getNavBarItems(),
      confineInSafeArea: true,
      navBarHeight: 56.h,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style11,
    );
  }

  List<Widget> _getNavBarScreens() {
    return const [
      HomeView(),
      SearchView(),
      SavedView(),
    ];
  }

  List<PersistentBottomNavBarItem> _getNavBarItems() {
    return [
      _getNavBarItem("Home", FontAwesomeIcons.house),
      _getNavBarItem("Search", FontAwesomeIcons.magnifyingGlass),
      _getNavBarItem("Saved", FontAwesomeIcons.bookmark),
    ];
  }

  PersistentBottomNavBarItem _getNavBarItem(String title, IconData icon) {
    return PersistentBottomNavBarItem(
      icon: FaIcon(icon),
      title: title,
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: Get.theme.colorScheme.secondary,
      textStyle: GoogleFonts.poppins(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
