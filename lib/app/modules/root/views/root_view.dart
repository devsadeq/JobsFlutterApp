import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../home/views/home_view.dart';
import '../../saved/views/saved_view.dart';
import '../../search/views/search_view.dart';
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
          showShadow: true,
          angle: 0.0,
          menuBackgroundColor: Get.theme.backgroundColor,
          slideWidth: 0.65.sw,
          menuScreenWidth: 0.65.sw,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
          style: DrawerStyle.style1,
          mainScreenTapClose: true,
          androidCloseOnBackTap: true,
          openDragSensitivity: 200,
          mainScreenOverlayColor: Colors.black.withOpacity(0.25),
        ),
      ),
    );
  }
}

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
      decoration: NavBarDecoration(boxShadow: [
        BoxShadow(
          color: Get.theme.colorScheme.secondary.withOpacity(.15),
          spreadRadius: 0,
          blurRadius: 159,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ],),
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
      _getNavBarItem(
        "Home",
        HeroIcons.home,
        () => controller.onHomeDoubleClick(),
      ),
      _getNavBarItem(
        "Search",
        HeroIcons.magnifyingGlass,
        () {},
      ),
      _getNavBarItem(
        "Saved",
        HeroIcons.bookmark,
        () {},
      ),
    ];
  }

  PersistentBottomNavBarItem _getNavBarItem(
    String title,
    HeroIcons icon,
    void Function() onDoubleTap,
  ) {
    return PersistentBottomNavBarItem(
      icon: HeroIcon(icon),
      title: title,
      activeColorPrimary: Get.theme.primaryColor,
      inactiveColorPrimary: Get.theme.colorScheme.secondary,
      onSelectedTabPressWhenNoScreensPushed: onDoubleTap,
      textStyle: GoogleFonts.poppins(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
