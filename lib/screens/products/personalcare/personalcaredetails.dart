import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/services/db_query.dart';

class PcDetail extends StatefulWidget {
  PcDetail({this.userId, this.productId});

  final String userId, productId;

  @override
  _PcDetailstate createState() => _PcDetailstate();
}

class _PcDetailstate extends State<PcDetail> {
  DBQuery _firebaseServices = DBQuery();
  //int _productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseServices.personalcareDetails(widget.userId),
      builder: (context, snapshot) {
        Products _pcDetails = snapshot.data;
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
              title: Text('Personal Care Details'),
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
                          image: NetworkImage(_pcDetails.url),
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
                                _pcDetails.name,
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
                              'Promotion: ' + _pcDetails.promotion.toString(),
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
                              'Category: ' + _pcDetails.category.toString(),
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
                              'Shelves: ' + _pcDetails.shelves.toString(),
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
                                  _pcDetails.price
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
                                  _pcDetails.description.toString(),
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
