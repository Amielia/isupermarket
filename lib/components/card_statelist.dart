import 'package:flutter/material.dart';

class CardStateList extends StatelessWidget {
  CardStateList({this.title, this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.all(1.0),
        child: ListTile(
          title: Text(title),
          onTap: onTap,
        ),
      ),
    );
  }
}
