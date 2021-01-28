import 'dart:convert';
import 'package:isupermarket/components/card_category.dart';
import 'package:isupermarket/components/card_product.dart';
import 'package:isupermarket/models/users.dart';
// import 'package:isupermarket/screens/products/beauty/beautylist.dart';
// import 'package:isupermarket/screens/products/frozen/frozenlist.dart';
import 'package:isupermarket/screens/products/groceries/grocerieslist.dart';
import 'package:isupermarket/screens/products/personalcare/personalcarelist.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:isupermarket/services/db_query.dart';

// // import 'package:egroceryapp/models/recipes.dart';
// import 'package:egroceryapp/screens/cart/cart.dart';
// import 'package:egroceryapp/screens/product/product_list.dart';
// import 'package:egroceryapp/screens/profile/profile_menu.dart';
// import 'package:egroceryapp/services/db_query.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String name;

  // getRecommendation(String id) async {
  //   try {
  //     List _rating = await DBQuery().getRatingsList(id);
  //     // List _recipe = await DBQuery().recipesList();

  //     // Recipe
  //     // List _listRecipeId = _recipe.map((recipe) => recipe.id).toList();
  //     // List _listRecipeName = _recipe.map((recipe) => recipe.name).toList();
  //     // List _listRecipeImage = _recipe.map((recipe) => recipe.image).toList();
  //     // List _listRecipeServings = _recipe.map((recipe) => recipe.servings).toList();

  //     // Rating
  //     List _listRatingId = _rating.map((rating) => rating.id).toList();
  //     List _listRatingRate = _rating.map((rating) => rating.rate).toList();
  //     // List _listRatingCustomerId =
  //     //     _rating.map((rating) => rating.customerId).toList();
  //     // List _listRatingRecipeId =
  //     //     _rating.map((rating) => rating.recipeId).toList();

  //     //   //print(_jsonListRecipe);
  //     //   apiRecommendation(_listRecipeId, _listRecipeName, _listRecipeImage, _listRecipeServings);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // apiRecommendation(List recipeId, List recipeName, List recipeImage,
  //     List recipeServings) async {
  //   const String url = 'http://74af3785511e.ngrok.io';

  //   final response = await post(
  //     '$url/recipe',
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(
  //       {
  //         'id': recipeId,
  //         'name': recipeName,
  //         'image': recipeImage,
  //         'servings': recipeServings,
  //       },
  //     ),
  //   );
  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //   } else {
  //     print('Error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users user = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('hello, ${user.name}'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/psa.jpg',
                    height: 100.0,
                    width: 300.0,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 15),
                      child: Text(
                        'Welcome To Pasaraya Angkasa Halhub!',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 15),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 320.0,
                    height: 150.0,
                    child: const Card(
                        child: Text(
                            'Pasaraya Angkasa is a company owned by 100% muslim bumiputera. It was established in October 2019. Our objective is to be a collection centre for bumiputera muslim products, thus giving opportunity for this products will be more competetive globally.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ))),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 25),
                      child: Text(
                        'Vision',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 320.0,
                    height: 80.0,
                    child: const Card(
                        child: Text(
                            'To be the largest one-stop centre for Muslim products in Malaysia for all sections and walks of life.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ))),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 25),
                      child: Text(
                        'Our Brand',
                        style: TextStyle(
                          height: 2.0,
                          fontFamily: 'Roboto',
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 400.0,
                    width: 330.0,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 25),
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          height: 3.0,
                          fontFamily: 'Roboto',
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/DETAILS.png',
                    height: 450.0,
                    width: 330.0,
                  ),

                  // Container(
                  //   width: MediaQuery.of(context).size.width / 0.5,
                  //   height: MediaQuery.of(context).size.height / 17,
                  //   margin:
                  //       EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       hintText: 'Search',
                  //       hintStyle: TextStyle(
                  //         height: 2.5,
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(25.0),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width / 20,
                  // ),
                  // Divider(
                  //   thickness: 2.0,
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width / 20,
                  // ),
                  // Text(
                  //   'Pick Your Catogery',
                  //   style: TextStyle(
                  //       fontSize: 15.0,
                  //       fontFamily: 'Roboto',
                  //       fontWeight: FontWeight.w800),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width / 20,
                  // ),
                  // //TODO: Infinite Scrolling
                  // Flexible(
                  //   child: MediaQuery.removePadding(
                  //     context: context,
                  //     removeBottom: true,
                  //     child: ListView(
                  //       shrinkWrap: true,
                  //       padding: EdgeInsets.zero,
                  //       scrollDirection: Axis.horizontal,
                  //       children: <Widget>[
                  //         CardCategory(
                  //           title: 'Groceries',
                  //           onTap: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => GroceryList(
                  //                   uid: '5FfFwRo7bML4sR8WBMcd',
                  //                   userId: user.uid,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //           image: 'assets/images/groceries.jpg',
                  //         ),
                  // CardCategory(
                  //   title: 'Frozen Food',
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => FrozenList(
                  //             // uid: 'btw068lPdzic4oHtRUGW',
                  //             // userId: user.uid,
                  //             ),
                  //       ),
                  //     );
                  //   },
                  //   image: 'assets/images/frozen-food.jpg',
                  // ),
                  // CardCategory(
                  //   title: 'Beauty',
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => BeautyList(
                  //             // uid: '15TqoZLABekkeMEUR9WI',
                  //             // userId: user.uid,
                  //             ),
                  //       ),
                  //     );
                  //   },
                  //   image: 'assets/images/makeup.jpg',
                  // ),
                  //         CardCategory(
                  //           title: 'Personal Care',
                  //           onTap: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => PersonalcareList(
                  //                     // uid: 'AbjCj6TDheRnapQ5wbza',
                  //                     // userId: user.uid,
                  //                     ),
                  //               ),
                  //             );
                  //           },
                  //           image: 'assets/images/personal care.jpeg',
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // FutureBuilder(
                  //   future: getRecommendation(widget.uid),
                  //   builder: (context, snapshot) {},
                  // ),
                  // Center(
                  //   child: RaisedButton(
                  //     child: Text('Click API'),
                  //     onPressed: () {
                  //       getRecommendation(widget.uid);
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       top: MediaQuery.of(context).size.width / 6),
                  // ),
                ],
              ),
            ),
          );
        } else {
          return SpinKitFoldingCube(
            color: Colors.deepOrange,
          );
        }
      },
    );
  }
}
