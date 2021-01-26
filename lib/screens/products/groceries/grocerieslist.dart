import 'package:isupermarket/components/card_product.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/screens/products/groceries/groceriesdetails.dart';
import 'package:isupermarket/services/db_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/screens/products/groceries/promotiongr.dart';

class GroceryList extends StatefulWidget {
  GroceryList({this.uid, String userId});

  final String uid;

  @override
  _GroceryListSate createState() => _GroceryListSate();
}

class _GroceryListSate extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().groceryList(widget.uid),
      builder: (context, snapshot) {
        List<Products> _groceryList = snapshot.data;
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: SpinKitRing(
              color: Colors.deepOrange,
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.deepOrange[100],
            appBar: AppBar(
              title: Text('Grocery'),
              actions: <Widget>[
                // Text(
                //   'Promotion',
                //   textAlign: TextAlign.start,
                // ),
                IconButton(
                  icon: Icon(Icons.notifications_active_rounded),
                  color: Colors.white,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PromotiongrList(uid: widget.uid),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
              itemCount: _groceryList.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, index) {
                return CardProduct(
                  name: _groceryList[index].name,
                  price: _groceryList[index].price,
                  url: _groceryList[index].url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroceryDetail(
                          userId: _groceryList[index].uid,
                          // userId: widget.userId,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
