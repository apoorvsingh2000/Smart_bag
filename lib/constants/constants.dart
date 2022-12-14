import 'package:flutter/material.dart';

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

//dynamic size
double kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;