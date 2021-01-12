import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isupermarket/models/promotion.dart';
import 'package:isupermarket/services/db_query.dart';

class PromotionDetail extends StatefulWidget {
  PromotionDetail({this.uid});

  final String uid;

  @override
  _PromotionDetailState createState() => _PromotionDetailState();
}

class _PromotionDetailState extends State<PromotionDetail> {
  DBQuery _firebaseServices = DBQuery();
  //int _productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseServices.promotiondetails(widget.uid),
      builder: (context, snapshot) {
        Promotion _promotiondetails = snapshot.data;
        if (snapshot.hasError || !snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: SpinKitRing(
              color: Colors.deepPurple,
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.deepPurple[100],
            appBar: AppBar(
              title: Text('Promotion Details'),
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
                          image: NetworkImage(_promotiondetails.url),
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
                                _promotiondetails.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19.0,
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
                              _promotiondetails.price
                                  .toStringAsFixed(2)
                                  .toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
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
                              'description : ' +
                                  _promotiondetails.description.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          // Padding(
                          //     padding: EdgeInsets.only(
                          //       left: MediaQuery.of(context).size.width / 20,
                          //       right: MediaQuery.of(context).size.width / 20,
                          //       top: MediaQuery.of(context).size.height / 50,
                          //     ),
                          //     child: Text(
                          //       'Shelves : ' +
                          //           _promotiondetails.shelves.toString(),
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 14.0,
                          //       ),
                          //     )),
                          // Padding(
                          //     padding: EdgeInsets.only(
                          //       left: MediaQuery.of(context).size.width / 20,
                          //       right: MediaQuery.of(context).size.width / 20,
                          //       top: MediaQuery.of(context).size.height / 50,
                          //     ),
                          //     child: Text(
                          //       'Synopsis : ' +
                          //           _promotiondetails.synopsis.toString(),
                          //       textAlign: TextAlign.justify,
                          //       style: TextStyle(
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 14.0,
                          //       ),
                          //     )),
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
