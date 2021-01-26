import 'package:isupermarket/components/card_product.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/screens/products/personalcare/personalcaredetails.dart';
import 'package:isupermarket/components/card_category.dart';
import 'package:isupermarket/screens/products/personalcare/promotionpc.dart';
import 'package:isupermarket/services/db_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PcList extends StatefulWidget {
  PcList({this.uid, String userId});

  final String uid;

  @override
  _PcListSate createState() => _PcListSate();
}

class _PcListSate extends State<PcList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBQuery().personalcareList(widget.uid),
      builder: (context, snapshot) {
        List<Products> _pcList = snapshot.data;
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
              title: Text('Personal Care'),
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
                        builder: (context) => PromotionpcList(uid: widget.uid),
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
              itemCount: _pcList.length,
              padding: EdgeInsets.all(5.0),

              //  CardCategory(
              //   title: 'PROMOTION',
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => PcDetail(),
              //       ),
              //     );
              //   },
              //   image: 'assets/images/frozen-food.jpg',
              // );
              itemBuilder: (context, index) {
                return CardProduct(
                  name: _pcList[index].name,
                  price: _pcList[index].price,
                  url: _pcList[index].url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PcDetail(
                          userId: _pcList[index].uid,

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
