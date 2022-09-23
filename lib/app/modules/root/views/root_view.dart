import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_flutter_app/app/modules/home/views/home_view.dart';
import 'package:jobs_flutter_app/app/modules/saved/views/saved_view.dart';
import 'package:jobs_flutter_app/app/modules/search/views/search_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.persistentTabController,
      screens: _getNavBarScreens(),
      items: _getNavBarItems(),
      confineInSafeArea: true,
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
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
