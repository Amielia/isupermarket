// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:isupermarket/screens/beacon/beaconbodo.dart';

// class ScanMe extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[100],
//       appBar: AppBar(
//         title: Text('Scan Me!'),
//         centerTitle: true,
//       ),
//       body: Center(child: MyHomePage()),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int currentIndex;
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
//   final PermissionHandler permissionHandler = PermissionHandler();
//   @override
//   void initState() {
//     super.initState();
//     currentIndex = 0;

//     FlutterBluetoothSerial.instance.state.then((state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });
//     enableBluetooth();
//     //requestLocationPermission();
//     //_gpsService();
//   }

//   Future<void> enableBluetooth() async {
//     // Retrieving the current Bluetooth state
//     _bluetoothState = await FlutterBluetoothSerial.instance.state;

//     // If the bluetooth is off, then turn it on first
//     // and then retrieve the devices that are paired.
//     if (_bluetoothState == BluetoothState.STATE_OFF) {
//       await FlutterBluetoothSerial.instance.requestEnable();
//       return true;
//     } else {}
//     return false;
//   }

//   ///1
//   Future<bool> _requestPermission(PermissionGroup permission) async {
//     final PermissionHandler _permissionHandler = PermissionHandler();
//     var result = await _permissionHandler.requestPermissions([permission]);
//     if (result[permission] == PermissionStatus.granted) {
//       return true;
//     }
//     return false;
//   }

// /*Checking if your App has been Given Permission*/
//   ///2
//   Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
//     var granted = await _requestPermission(PermissionGroup.location);
//     if (granted != true) {
//       requestLocationPermission();
//     }
//     debugPrint('requestContactsPermission $granted');
//     return granted;
//   }

//   // void changePage(int index) {
//   //   setState(() {
//   //     currentIndex = index;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text(
//           "WARNING !!",
//           style: TextStyle(
//               color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           "\nTurn On Bluetooth First Before Scan\n",
//           style: TextStyle(
//               color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
//         ),
//         Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//           Image.asset(
//             'assets/images/beacon.gif',
//             height: 300,
//             width: 500,
//           ),
//         ]),
//         Text(
//           "\nScanning Nearby Beacons in Main Lobby\n",
//           style: TextStyle(
//               color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
//         ),
//         RaisedButton(
//           textColor: Colors.white,
//           color: Colors.redAccent,
//           child: Text('Scan Me'),
//           onPressed: () async {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BeaconWidget(),
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }
