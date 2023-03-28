import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_bag/screens/ble_screen.dart';
import 'package:smart_bag/screens/scan_screen.dart';
import 'package:smart_bag/screens/HomeScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ScanScreen.id: (context) => BleScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: ScanScreen.id,
    );
  }
}
