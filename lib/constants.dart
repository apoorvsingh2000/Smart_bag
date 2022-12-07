import 'package:flutter/material.dart';

//Text
Text kScanText(BuildContext context) => Text('Scan', style: TextStyle(color: Colors.white, fontSize: kScreenWidth(context)*0.05),);

//TextButton style
ButtonStyle kTextButtonStyle (BuildContext context) => TextButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.all(kScreenWidth(context)*0.03),);

//dynamic size
double kScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;