import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  CardProduct({this.url, this.onTap, this.name, this.price});

  final String url;
  final Function onTap;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.only(bottom: 15.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: Colors.deepOrangeAccent.withAlpha(30),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: NetworkImage(url),
                width: 150.0,
                height: 130.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(13.0, 12.0, 13.0, 8.0),
              child: Column(
                children: <Widget>[
                  Text(name),
                  SizedBox(height: 10.0),
                  Text('RM ' + price.toStringAsFixed(2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
