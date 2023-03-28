import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

//Text
Text kScanText(BuildContext context) => Text('Scan', style: TextStyle(color: Colors.white, fontSize: kScreenWidth(context)*0.05),);
kBluetooth(BuildContext context) => Text('Bluetooth', style: TextStyle(color: Colors.black, fontSize: kScreenWidth(context)*0.04),);
kCredsInstr(BuildContext context) => Text('Note: Once you connect the bluetooth, please enter the WiFi credentials below',
  style: TextStyle(color: Colors.black, fontSize: kScreenWidth(context)*0.03),);
kCreds(BuildContext context) => Text('WiFi Credentials', style: TextStyle(color: Colors.black, fontSize: kScreenWidth(context)*0.04),);
kAppName(BuildContext context) => Text('Smart Bag', style: TextStyle(color: Colors.white, fontSize: kScreenWidth(context)*0.05),);

//padding
EdgeInsets kScreenpadding (BuildContext context) => EdgeInsets.all(kScreenWidth(context)*0.03);
EdgeInsets kScrollPadding (BuildContext context) => EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
    top: kScreenWidth(context)*0.03, left: kScreenWidth(context)*0.03, right: kScreenWidth(context)*0.03);
EdgeInsets expantionTilePaddingFaq(BuildContext context) => EdgeInsets.only(
    left: screenWidth(context) * 0.03,
    right: screenWidth(context) * 0.03,
    top: screenWidth(context) * 0.02,
    bottom: screenWidth(context) * 0.02);

//dynamic size
double kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//bottom nav bar item
PersistentBottomNavBarItem navBarItem (String imagePath, String title) => PersistentBottomNavBarItem(
  icon: Image.asset(imagePath, color: Colors.black,),
  title: (title),textStyle: GoogleFonts.raleway(),
  activeColorPrimary: Colors.black,
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;