import 'package:isupermarket/components/card_product.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/screens/products/groceries/groceriesdetails.dart';
import 'package:isupermarket/services/db_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PromotiongrList extends StatefulWidget {
  PromotiongrList({this.uid, String userId});

  final String uid;

  @override
  _PromotiongrListSate createState() => _PromotiongrListSate();
}

class _PromotiongrListSate extends State<PromotiongrList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().promotiongrList(),
      builder: (context, snapshot) {
        List<Products> product = snapshot.data;
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: SpinKitRing(
              color: Colors.deepOrange,
            ),
          );
        } else {
          var gridView = GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            ),
            itemCount: product.length,
            padding: EdgeInsets.all(5.0),
            itemBuilder: (context, index) {
              return CardProduct(
                name: product[index].name,
                price: product[index].price,
                url: product[index].url,
                onTap: () {
                  if (product[index].category == 'Grocery') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroceryDetail(
                          userId: product[index].uid,
                          // userId: widget.userId,
                        ),
                      ),
                    );
                  } else {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => PersonalcareDetail(
                    //       productId: product[index].uid,
                    //       // userId: widget.userId,
                    //     ),
                    //   ),
                    // );
                  }
                },
              );
            },
          );
          return Scaffold(
            backgroundColor: Colors.deepOrange[100],
            appBar: AppBar(
              title: Text('Promotion'),
            ),
            body: SingleChildScrollView(child: gridView),
          );
        }
      },
    );
  }
}
