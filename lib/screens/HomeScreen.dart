import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_bag/constants/strings.dart';
import 'package:smart_bag/screens/dashboard_screen.dart';
import 'package:smart_bag/screens/faq_screen.dart';
import 'package:smart_bag/screens/items_screen.dart';
import 'package:smart_bag/screens/timetable_screen.dart';
import '../constants/constants.dart';
import 'student_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      FaqScreen(),
      StudentProfileScreen(),
      Dashboard(),
      TimetableScreen(),
      ItemsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      navBarItem(kFaqImagePath, kFaqs),
      navBarItem(kFaqProfileImagePath, kMyProfile),
      navBarItem(kFaqHomeImagePath, kDashboard),
      navBarItem(kTimetableImagePath, kTimetable),
      navBarItem(kAllItemsImagePath, kAllItems),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [const Text('Student ID'),Row(
            children: [
              Text('Device Status\t', style: TextStyle(fontSize: screenWidth(context)*0.03),),
              SizedBox(width: screenWidth(context)*0.01, child: const Icon(Icons.circle_sharp, color: Colors.green,))
            ],
          ),],),
          Image.asset(kSettingsImagePath),
        ],
      ),),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.lightBlueAccent, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(4.0),
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
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property.
      ),
    );
  }
}
