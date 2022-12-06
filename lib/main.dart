import 'package:flutter/material.dart';
import 'package:smart_bag/screens/scan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ScanScreen.id: (context) => ScanScreen(),
      },
      initialRoute: ScanScreen.id,
    );
  }
}
