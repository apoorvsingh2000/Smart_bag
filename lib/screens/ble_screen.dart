import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
const String targetDeviceName = 'My BLE Device'; // Replace with your device's name
const String targetServiceUUID = '0000180f-0000-1000-8000-00805f9b34fb'; // Replace with your service's UUID
const String targetCharacteristicUUID = '00002a19-0000-1000-8000-00805f9b34fb'; // Replace with your characteristic's UUID

class BleScreen extends StatefulWidget {
  @override
  _BleScreenState createState() => _BleScreenState();
}

class _BleScreenState extends State<BleScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice targetDevice;
  late BluetoothService targetService;
  late BluetoothCharacteristic targetCharacteristic;
  bool isConnected = false;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    flutterBlue.state.listen((state) {
      if (state == BluetoothState.on) {
        scanForDevice();
      }
    });
  }

  void scanForDevice() {
    flutterBlue.scan(timeout: Duration(seconds: 5)).listen((scanResult) {
      if (scanResult.device.name == targetDeviceName) {
        print('Found device: ${scanResult.device.name}');
        stopScan();
        connectToDevice(scanResult.device);
      }
    });
  }

  void stopScan() {
    flutterBlue.stopScan();
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    print('Connecting to ${device.name}');
    await device.connect();
    print('Connected to ${device.name}');
    setState(() {
      targetDevice = device;
      isConnected = true;
    });
    discoverServices();
  }

  void discoverServices() async {
    print('Discovering services...');
    List<BluetoothService> services = await targetDevice.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == targetServiceUUID) {
        targetService = service;
        discoverCharacteristics();
      }
    });
  }

  void discoverCharacteristics() async {
    print('Discovering characteristics...');
    List<BluetoothCharacteristic> characteristics =
        await targetService.characteristics;
    characteristics.forEach((characteristic) {
      if (characteristic.uuid.toString() == targetCharacteristicUUID) {
        targetCharacteristic = characteristic;
      }
    });
  }

  void sendString(String text) async {
    List<int> bytes = utf8.encode(text);
    await targetCharacteristic.write(bytes);
    print('Sent "$text" to ${targetDevice.name}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter text to send to BLE device',
                contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              child: Text('Send'),
              onPressed: () {
                final text = textController.text;
                sendString(text);
              },
            ),
            SizedBox(height: 10.0),
            isConnected
                ? Text('Connected to ${targetDevice.name}')
                : Text('Scanning for BLE device...'),
          ],
        ),
      ),
    );
  }
}
