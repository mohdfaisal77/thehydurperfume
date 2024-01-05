import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydur/ui/diffuser/select_diffuser.dart';
import 'package:hydur/utils/app_color.dart';
import 'package:hydur/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../utils/strings.dart';
import '../webview/web_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColor.color_black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.logo,
                width: width,
                height: height * 0.5,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Image.asset(
                  Images.hydur_connect,
                  width: width * 0.4,
                  height: height * 0.1,
                ),
              ),
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomBar(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20, bottom: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Strings.lets_begin,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: AppColor.color_white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 14),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Images.arrows,
                            width: 5.4,
                            height: 10.9,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      WebViewScreen("https://hydur.com/pages/offers", "Offer"),
      WebViewScreen("https://hydur.co.uk", "Shop"),
      const SelectDiffuser(),
      WebViewScreen("https://hydur.com/pages/user-guide", "Guides"),
      WebViewScreen("https://hydurtravel.com/", "Travel"),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Images.offer, width: 15.1, height: 15),
        title: (Strings.offer),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Images.shop, width: 15.1, height: 15),
        title: (Strings.shop),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Images.home, width: 18.7, height: 19.7),
        // title: (Strings.home),
        activeColorPrimary: AppColor.color_white,
        inactiveColorPrimary: AppColor.inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Images.guide, width: 15.1, height: 15),
        title: (Strings.guides),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.inactiveColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Images.travel, width: 15.1, height: 15),
        title: (Strings.travel),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.inactiveColor,
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
      confineInSafeArea: true,
      backgroundColor: AppColor.backgroud_color3,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
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
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 81,
      // Choose the nav bar style with this property.
    );
  }
}
