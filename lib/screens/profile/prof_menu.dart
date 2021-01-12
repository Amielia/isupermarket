import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/components/card_profile.dart';
import 'package:isupermarket/screens/profile/prof_address.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/screens/profile/prof_user.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: uid).userData,
      builder: (context, snapshot) {
        Users usersData = snapshot.data;
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Account Settings'),
            ),
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Text('My Account'),
                SizedBox(
                  height: 15.0,
                ),
                CardProfile(
                  title: 'My Profile',
                  data: '',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfile(
                          uid: uid,
                          u: usersData,
                        ),
                      ),
                    );
                  },
                ),
                CardProfile(
                  title: 'My Address',
                  data: '',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserAddress(
                          uid: uid,
                        ),
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   height: 15.0,
                // ),
                // Text('My Recipe\'s Rating'),
                // SizedBox(
                //   height: 15.0,
                // ),
                // CardProfile(
                //   title: 'Review Recipe',
                //   data: '',
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => UserProfile(uid: uid)),
                //     );
                //   },
                // ),
                // SizedBox(
                //   height: 15.0,
                // ),
                // Text('Settings'),
                // SizedBox(
                //   height: 15.0,
                // ),
                // CardProfile(
                //   title: 'Change Password',
                //   data: '',
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => UserProfile(uid: uid),
                //       ),
                //     );
                //   },
                // ),
                // CardProfile(
                //   title: 'Delete Account',
                //   data: '',
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => UserProfile(uid: uid),
                //       ),
                //     );
                //   },
                // ),
              ],
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
