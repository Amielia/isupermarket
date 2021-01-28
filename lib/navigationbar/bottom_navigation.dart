import 'package:isupermarket/screens/home.dart';
// import 'package:egroceryapp/screens/recipe/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:isupermarket/screens/products/groceries/grocerieslist.dart';
import 'package:isupermarket/screens/products/personalcare/personalcarelist.dart';
import 'package:isupermarket/screens/profile/prof_menu.dart';
import 'package:isupermarket/services/auth.dart';
import 'package:isupermarket/screens/beacon/scanme.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/services/db_query.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({this.uid});

  final String uid;

  final AuthService _authService = AuthService();

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  var onPressed;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Home(uid: widget.uid),
      ScanMe(),
      ProfileMenu(uid: widget.uid),
      // PersonalcareList(uid: widget.uid),
      // onPressed: () async {
      //  await _auth.signOut()
      //  }
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_grocery_store_rounded),
          //   title: Text('Personal Care'),
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.exit_to_app),
          //   title: Text('Sign Out'),
          // ),
        ],
      ),
    );
  }
}
