// import 'package:isupermarket/screens/home.dart';
// import 'package:isupermarket/models/users.dart';
// import 'package:isupermarket/login.dart';
// import 'package:flutter/material.dart';
// // import 'package:isupermarket/navigationbar/bottom_navigation.dart';
// import 'package:provider/provider.dart';

// class Wrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<Users>(context);

//     //Return either the Home or Login Page
//     if (user == null) {
//       return Login();
//     } else {
//       return BottomNavigation(uid: user.uid);
//       // return Home();
//     }
//   }
// }

// import 'file:///C:/development/fyp/e_grocery_app/lib/navigation/bottom_navigation.dart';
import 'package:isupermarket/navigationbar/bottom_navigation.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    //Return either the Home or Login Page
    if (user == null) {
      return Login();
    } else {
      return BottomNavigation(uid: user.uid);
    }
  }
}
