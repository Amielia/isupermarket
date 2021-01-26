// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:intl/intl.dart';
// import 'package:isupermarket/models/cart.dart';
// import 'package:isupermarket/services/db_query.dart';
// import 'package:isupermarket/services/payment_service.dart';
// import 'package:isupermarket/models/products.dart';

// class Payment extends StatefulWidget {
//   Payment({this.uid, this.price});

//   final String uid;
//   final double price;

//   @override
//   _PaymentState createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   String price = '';
//   String stripePrice = '';
//   double priceDouble = 0.0;

//   double totalPrice() {
//     return widget.price + 5;
//   }

//   payWithCard(BuildContext context) async {
//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('d MMM yyyy kk:mm:ss').format(now);

//     priceDouble = double.parse(price) * 100;
//     stripePrice = priceDouble.toStringAsFixed(0);

//     var response = await StripeService.payWithNewCard(
//       amount: stripePrice,
//       currency: 'MYR',
//     );
//     if (response.success == true) {
//       await DBQuery().addTransactionsAndOrders(response.paymentIntentId,
//           double.parse(stripePrice) / 100, formattedDate, widget.uid);

//       Scaffold.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response.message),
//           duration: Duration(milliseconds: 1500),
//         ),
//       );

//       // Navigator.of(context).pushAndRemoveUntil(
//       //   MaterialPageRoute(
//       //     builder: (context) => BottomNavigation(
//       //       uid: widget.uid,
//       //     ),
//       //   ),
//       //   (Route<dynamic> route) => false,
//       // );
//     } else {
//       Scaffold.of(context).showSnackBar(
//         SnackBar(
//           content: Text(response.message),
//           duration: Duration(milliseconds: 3000),
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     StripeService.init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Check Out'),
//       ),
//       body: Builder(
//         builder: (context) => Column(
//           children: <Widget>[
//             Expanded(
//               child: FutureBuilder(
//                   future: DBQuery().cartsList(widget.uid),
//                   builder: (context, snapshot) {
//                     List<Carts> _cartsList = snapshot.data;
//                     if (!snapshot.hasData) {
//                       return SpinKitCircle(
//                         color: Colors.deepOrange,
//                       );
//                     }
//                     int listCarts = _cartsList.length;
//                     return ListView.builder(
//                       itemCount: listCarts,
//                       itemBuilder: (context, index) {
//                         return FutureBuilder(
//                           future: DBQuery()
//                               .productDetailCarts(_cartsList[index].productId),
//                           builder: (context, snapshot) {
//                             List<Products> _productsList = snapshot.data;
//                             if (!snapshot.hasData) {
//                               return SpinKitCircle(
//                                 color: Colors.deepOrange,
//                               );
//                             }
//                             return ListView.separated(
//                               physics: ClampingScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: _productsList.length,
//                               separatorBuilder: (context, index) => Divider(
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                               itemBuilder: (context, index1) => Column(
//                                 children: <Widget>[
//                                   Card(
//                                     margin: EdgeInsets.symmetric(vertical: 0.0),
//                                     color: Colors.white,
//                                     elevation: 3.0,
//                                     child: Container(
//                                       padding: EdgeInsets.only(
//                                         top: MediaQuery.of(context).size.width /
//                                             25,
//                                         bottom:
//                                             MediaQuery.of(context).size.width /
//                                                 25,
//                                       ),
//                                       child: Row(
//                                         children: <Widget>[
//                                           Container(
//                                             padding: EdgeInsets.all(
//                                               MediaQuery.of(context)
//                                                       .size
//                                                       .width /
//                                                   25,
//                                             ),
//                                             child: Image(
//                                               image: NetworkImage(
//                                                   _productsList[index1].image),
//                                               width: 120.0,
//                                               height: 120.0,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Container(
//                                               padding: EdgeInsets.only(
//                                                   right: MediaQuery.of(context)
//                                                           .size
//                                                           .width /
//                                                       25),
//                                               child: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Text(
//                                                     _productsList[index1].name,
//                                                     style: TextStyle(
//                                                       fontSize: 17.0,
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 12.0,
//                                                   ),
//                                                   Row(
//                                                     children: <Widget>[
//                                                       Text(
//                                                         'RM ' +
//                                                             _productsList[
//                                                                     index1]
//                                                                 .price
//                                                                 .toStringAsFixed(
//                                                                     2)
//                                                                 .toString(),
//                                                         style: TextStyle(
//                                                           fontSize: 20.0,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Spacer(),
//                                                       Container(
//                                                         child: Text(
//                                                           _cartsList[index]
//                                                                   .quantity
//                                                                   .toString() +
//                                                               'x',
//                                                           style: TextStyle(
//                                                             fontSize: 19.0,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                           ),
//                                                         ),
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                           right: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width /
//                                                               30,
//                                                           left: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width /
//                                                               30,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   SizedBox(
//                                                     height:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .height /
//                                                             200,
//                                                   ),
//                                                   Text(
//                                                     'Quantity: ' +
//                                                         _productsList[index1]
//                                                             .quantity
//                                                             .toString(),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                   }),
//             ),
//             Card(
//               margin: EdgeInsets.symmetric(vertical: 0.0),
//               color: Colors.white,
//               elevation: 3.0,
//               child: Column(
//                 children: <Widget>[
//                   Divider(
//                     height: 10.0,
//                     thickness: 3.0,
//                     color: Colors.black26,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(
//                       MediaQuery.of(context).size.width / 25,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               'Total:',
//                             ),
//                             SizedBox(
//                               height: 5.0,
//                             ),
//                             Text(
//                               'RM ${price = totalPrice().toStringAsFixed(2).toString()}',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 5,
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             height: MediaQuery.of(context).size.width / 8,
//                             width: MediaQuery.of(context).size.width / 2.5,
//                             child: FlatButton(
//                               color: Colors.deepOrange,
//                               onPressed: () {
//                                 payWithCard(context);
//                               },
//                               child: Text(
//                                 'Place Order',
//                                 style: TextStyle(
//                                   fontSize: 17.0,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
