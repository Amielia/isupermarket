import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  CardCategory({this.title, this.onTap, this.image});

  final String title;
  final Function onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: InkWell(
            splashColor: Colors.deepOrangeAccent.withAlpha(30),
            onTap: onTap,
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              width: 120.0,
              height: 100.0,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
