import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_bag/constants.dart';

class ScanScreen extends StatefulWidget {
  static const String id = 'scan_screen';
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  // Get the instance of the Bluetooth
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Track the Bluetooth connection with the remote device
  BluetoothConnection connection = null as BluetoothConnection;

  // To track whether the device is still connected to Bluetooth
  bool get isConnected => connection != null && connection.isConnected;

  int _deviceState = 0;

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    _deviceState = 0; // neutral

    // If the Bluetooth of the device is not enabled,
    // then request permission to turn on Bluetooth
    // as the app starts up
    enableBluetooth();

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // For retrieving the paired devices list
        getPairedDevices();
      });
    });
  }

  Future<bool> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the Bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  List<BluetoothDevice> _devicesList = [];

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  bool isDisconnecting = false;

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null as BluetoothConnection;
    }

    super.dispose();
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(
        const DropdownMenuItem(
          child: Text('Turn on Bluetooth', style: TextStyle(color: Colors.black),),
        ),
      );
    } else {
      for (var device in _devicesList) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name),
        ));
      }
    }
    return items;
  }

  void _connect() async {
    if (_device == null) {
    } else {
      // If a device is selected from the
      // dropdown, then use it here
      if (!isConnected) {
        // Trying to connect to the device using
        // its address
        await BluetoothConnection.toAddress(_device.address).then(
          (_connection) {
            print('Connected to the device');
            connection = _connection;

            // Updating the device connectivity
            // status to [true]
            setState(() {
              _connected = true;
            });

            // This is for tracking when the disconnecting process
            // is in progress which uses the [isDisconnecting] variable
            // defined before.
            // Whenever we make a disconnection call, this [onDone]
            // method is fired.
            connection.input.listen(null).onDone(
              () {
                if (isDisconnecting) {
                  print('Disconnecting locally!');
                } else {
                  print('Disconnected remotely!');
                }
                if (this.mounted) {
                  setState(() {});
                }
              },
            );
          },
        ).catchError(
          (error) {
            print(error);
          },
        );
      }
    }
  }

  void _disconnect() async {
    // Closing the Bluetooth connection
    await connection.close();

    // Update the [_connected] variable
    if (!connection.isConnected) {
      setState(() {
        _connected = false;
      });
    }
  }

  bool _connected = false;
  BluetoothDevice _device = null as BluetoothDevice;
  bool _isButtonUnavailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppName(context),),
      body: SafeArea(
        child: Padding(
          padding: kScreenpadding(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kBluetooth(context),
                  Switch(
                    value: _bluetoothState.isEnabled,
                    onChanged: (bool value) {
                      future() async {
                        if (value) {
                          // Enable Bluetooth
                          await FlutterBluetoothSerial.instance.requestEnable();
                        } else {
                          // Disable Bluetooth
                          await FlutterBluetoothSerial.instance.requestDisable();
                        }

                        // In order to update the devices list
                        await getPairedDevices();
                        _isButtonUnavailable = false;

                        // Disconnect from any device before
                        // turning off Bluetooth
                        if (_connected) {
                          _disconnect();
                        }
                      }

                      future().then((_) {
                        setState(() {});
                      });
                    },
                  ),
                ],
              ),
              Flexible(
                fit: FlexFit.loose,
                child: DropdownButton(
                  items: _getDeviceItems(),
                  onChanged: (value) =>
                      setState(() => _device = value as BluetoothDevice),
                  value: _devicesList.isNotEmpty ? _device : null,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ElevatedButton(
                  onPressed: _isButtonUnavailable
                      ? null
                      : _connected
                          ? _disconnect
                          : _connect,
                  child: Text(_connected ? 'Disconnect' : 'Connect'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
