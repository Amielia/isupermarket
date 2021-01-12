import 'package:isupermarket/components/card_product.dart';
import 'package:isupermarket/models/promotion.dart';
import 'package:isupermarket/screens/promotion/promotiondetails.dart';
import 'package:isupermarket/services/db_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PromotionList extends StatefulWidget {
  PromotionList({this.uid, String userId});

  final String uid;

  @override
  _PromotionListSate createState() => _PromotionListSate();
}

class _PromotionListSate extends State<PromotionList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().promotionlist(widget.uid),
      builder: (context, snapshot) {
        List<Promotion> _promotionlist = snapshot.data;
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
              title: Text('Promotion List'),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
              itemCount: _promotionlist.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, index) {
                return CardProduct(
                  name: _promotionlist[index].name,
                  price: _promotionlist[index].price,
                  url: _promotionlist[index].url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PromotionDetail(
                          uid: _promotionlist[index].uid,
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
