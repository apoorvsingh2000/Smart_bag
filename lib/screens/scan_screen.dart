import 'package:flutter/material.dart';
import 'package:smart_bag/constants.dart';

class ScanScreen extends StatefulWidget {
  static const String id = 'scan_screen';
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            style: kTextButtonStyle(context),
            onPressed: () {},
            child: kScanText(context),
          ),
        ),
      ),
    );
  }
}
