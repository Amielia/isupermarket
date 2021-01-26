// import 'dart:convert';
// import 'package:isupermarket/components/card_category.dart';
// import 'package:isupermarket/components/card_product.dart';
// import 'package:isupermarket/models/products.dart';
// import 'package:isupermarket/models/users.dart';
// import 'package:isupermarket/screens/cart/cart.dart';
// import 'package:isupermarket/screens/products/groceries/groceriesdetails.dart';
// // import 'package:isupermarket/screens/products/beauty/beautylist.dart';
// // import 'package:isupermarket/screens/products/frozen/frozenlist.dart';
// import 'package:isupermarket/screens/products/groceries/grocerieslist.dart';
// import 'package:isupermarket/screens/products/personalcare/personalcaredetails.dart';
// import 'package:isupermarket/screens/products/personalcare/personalcarelist.dart';
// import 'package:isupermarket/services/database_service.dart';
// import 'package:isupermarket/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart';
// import 'package:isupermarket/services/db_query.dart';

// // // import 'package:egroceryapp/models/recipes.dart';
// // import 'package:egroceryapp/screens/cart/cart.dart';
// // import 'package:egroceryapp/screens/product/product_list.dart';
// // import 'package:egroceryapp/screens/profile/profile_menu.dart';
// // import 'package:egroceryapp/services/db_query.dart';

// class Home extends StatefulWidget {
//   final String uid;

//   Home({this.uid});

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final AuthService _auth = AuthService();
//   String name;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Users>(
//       stream: DatabaseService(uid: widget.uid).userData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           Users user = snapshot.data;
//           return Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               title: Text('hello, ${user.name}'),
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.shopping_cart),
//                   color: Colors.white,
//                   onPressed: () async {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => Cart(uid: widget.uid),
//                     //   ),
//                     // );
//                   },
//                 ),
//                 // IconButton(
//                 //   icon: Icon(Icons.account_circle),
//                 //   color: Colors.white,
//                 //   onPressed: () async {
//                 //     Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //         builder: (context) => ProfileMenu(uid: widget.uid),
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//                 IconButton(
//                   icon: Icon(Icons.exit_to_app),
//                   color: Colors.white,
//                   onPressed: () async {
//                     await _auth.signOut();
//                   },
//                 ),
//               ],
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/images/psa.jpg',
//                     height: 100.0,
//                     width: 300.0,
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           top: MediaQuery.of(context).size.width / 15),
//                       child: Text(
//                         'Promotion',
//                         style: TextStyle(
//                           fontFamily: 'Roboto',
//                           color: Colors.deepOrangeAccent,
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ),
//                   FutureBuilder(
//                       future: DBQuery().productsList(),
//                       builder: (context, snapshot) {
//                         List<Products> product = snapshot.data;
//                         if (!snapshot.hasData) {
//                           return SpinKitCircle(
//                             color: Colors.deepOrangeAccent,
//                           );
//                         }
//                         return GridView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             childAspectRatio:
//                                 MediaQuery.of(context).size.width /
//                                     (MediaQuery.of(context).size.height / 1.5),
//                           ),
//                           itemCount: product.length,
//                           padding: EdgeInsets.all(5.0),
//                           itemBuilder: (context, index) {
//                             return CardProduct(
//                               name: product[index].name,
//                               price: product[index].price,
//                               url: product[index].url,
//                               onTap: () {
//                                 if (product[index].category == 'Grocery') {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => GroceryDetail(
//                                         userId: product[index].uid,
//                                         // userId: widget.userId,
//                                       ),
//                                     ),
//                                   );
//                                 } else {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => PersonalcareDetail(
//                                         productId: product[index].uid,
//                                         // userId: widget.userId,
//                                       ),
//                                     ),
//                                   );
//                                 }
//                               },
//                             );
//                           },
//                         );
//                       }),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return SpinKitFoldingCube(
//             color: Colors.deepOrange,
//           );
//         }
//       },
//     );
//   }
// }
