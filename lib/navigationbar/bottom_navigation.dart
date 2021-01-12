import 'package:isupermarket/screens/home.dart';
// import 'package:egroceryapp/screens/recipe/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:isupermarket/screens/promotion/scanme.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({this.uid});

  final String uid;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

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
            title: Text('Promotion'),
          ),
        ],
      ),
    );
  }
}
