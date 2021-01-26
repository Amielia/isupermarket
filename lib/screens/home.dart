import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/screens/products/groceries/grocerieslist.dart';
import 'package:isupermarket/screens/products/personalcare/personalcarelist.dart';
import 'package:isupermarket/services/db_query.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:isupermarket/screens/beacon/beacons3.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String name;
  int currentIndex;
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  final PermissionHandler permissionHandler = PermissionHandler();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users user = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('hello, ${user.name}'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.shopping_cart),
                //   color: Colors.white,
                //   onPressed: () async {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => PcList(),
                //       ),
                //     );
                //   },
                // ),
                // IconButton(
                //   icon: Icon(Icons.pregnant_woman),
                //   color: Colors.white,
                //   onPressed: () async {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => GroceryList(),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/psa.jpg',
                    height: 100.0,
                    width: 300.0,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 15),
                      child: Text(
                        'Welcome to Pasaraya Angkasa Halhub',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.deepOrangeAccent,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/beacon.gif',
                              height: 300,
                              width: 500,
                            ),
                          ]),

                      Text(
                        "Please turn on your Bluetooth first!\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),

                      // Text(
                      //   "Scanning Nearby Beacons\n",
                      //   style: TextStyle(
                      //       color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                      // ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.deepOrange[400],
                        child: Text('Click Here'),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BeaconWidget(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return SpinKitFoldingCube(
            color: Colors.deepOrange,
          );
        }
      },
    );
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;

    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
    enableBluetooth();
    //requestLocationPermission();
    //_gpsService();
  }

  Future<void> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      return true;
    } else {}
    return false;
  }

  ///1
  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

//Checking if your App has been Given Permission/
  ///2
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted != true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }

  // void changePage(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }
}
