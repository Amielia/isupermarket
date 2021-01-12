import 'package:isupermarket/components/card_profile.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/screens/profile/prof_edit.dart';
import 'package:isupermarket/screens/profile/prof_statelist.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserAddress extends StatelessWidget {
  UserAddress({this.uid});

  final String uid;
  String postcode = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users usersData = snapshot.data;

          //Remove number (0) from display
          if (usersData.postcode == 0) {
            postcode = '';
          } else {
            postcode = usersData.postcode.toString();
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Manage Address'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CardProfile(
                            title: 'Address',
                            data: usersData.address,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: uid,
                                    title: 'Edit Address',
                                    hintText: 'Enter your address',
                                    value: usersData.address,
                                    validate: 'Please enter a phone number',
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'State',
                            data: usersData.state,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditStateList(
                                    uid: uid,
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'City',
                            data: usersData.city,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: uid,
                                    title: 'Edit City',
                                    hintText: 'Enter your city',
                                    value: usersData.city,
                                    validate: 'Please enter a city',
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Postcode',
                            data: postcode,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: uid,
                                    title: 'Edit Postcode',
                                    hintText: 'Enter your postcode',
                                    value: postcode,
                                    validate: 'Please enter a postcode',
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
}
