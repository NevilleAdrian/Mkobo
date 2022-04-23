import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkobo/screens/background/background.dart';
import 'package:mkobo/utils/assets.dart';
import 'package:mkobo/utils/colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/home.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Home(),
      const Home(),
      const Home(),
      const Home(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        // inactiveIcon: const Icon(Icons.home_outlined),
        title: ("Accounts"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon:  const Icon(Icons.currency_exchange),
        // inactiveIcon: SvgPicture.asset(Assets.mkolo, color: greyColor),
        title: ("Mkolo"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.transfer, height:35,),
        title: ("Transfer "),
        // textStyle: TextStyle(fontSize: 1),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.handshake),
        // inactiveIcon: SvgPicture.asset(Assets.earlypay, color: greyColor),
        title: ("EarlyPay"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu),
        inactiveIcon: Icon(Icons.menu),
        title: ("Menu"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: greyColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 60,
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,

        boxShadow:[
          const BoxShadow(
            color: Colors.white,
            spreadRadius: 5,
            blurRadius: 0,
            offset: Offset(0, -1), // changes position of shadow
          ),
        ]
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
