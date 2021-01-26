import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/services/db_query.dart';

class GroceryDetail extends StatefulWidget {
  GroceryDetail({this.userId, this.productId});

  final String userId, productId;

  @override
  _GroceryDetailstate createState() => _GroceryDetailstate();
}

class _GroceryDetailstate extends State<GroceryDetail> {
  DBQuery _firebaseServices = DBQuery();
  //int _productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseServices.groceryDetails(widget.userId),
      builder: (context, snapshot) {
        Products _groceryDetails = snapshot.data;
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: SpinKitRing(
              color: Colors.deepOrange,
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Grocery Details'),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                    ),
                    Center(
                      child: Container(
                        height: 250.0,
                        width: 250.0,
                        child: Image(
                          image: NetworkImage(_groceryDetails.url),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 20,
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                _groceryDetails.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                              top: MediaQuery.of(context).size.height / 50,
                            ),
                            child: Text(
                              'Promotion: ' +
                                  _groceryDetails.promotion.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                              top: MediaQuery.of(context).size.height / 50,
                            ),
                            child: Text(
                              'Category: ' +
                                  _groceryDetails.category.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                              top: MediaQuery.of(context).size.height / 50,
                            ),
                            child: Text(
                              'Shelves: ' + _groceryDetails.shelves.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                              top: MediaQuery.of(context).size.height / 50,
                            ),
                            child: Text(
                              'Price : RM ' +
                                  _groceryDetails.price
                                      .toStringAsFixed(2)
                                      .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20,
                              right: MediaQuery.of(context).size.width / 20,
                              top: MediaQuery.of(context).size.height / 50,
                            ),
                            child: Text(
                              'Description : ' +
                                  _groceryDetails.description.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
