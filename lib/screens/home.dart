import 'dart:convert';
import 'package:isupermarket/components/card_category.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/screens/profile/prof_menu.dart';
import 'package:isupermarket/screens/promotion/promotionlist.dart';
// // import 'package:egroceryapp/models/recipes.dart';
// import 'package:egroceryapp/screens/cart/cart.dart';
// import 'package:egroceryapp/screens/product/product_list.dart';
// import 'package:egroceryapp/screens/profile/profile_menu.dart';
// import 'package:egroceryapp/services/db_query.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:isupermarket/services/db_query.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String name;

  getRecommendation(String id) async {
    try {
      List _rating = await DBQuery().getRatingsList(id);
      // List _recipe = await DBQuery().recipesList();

      // Recipe
      // List _listRecipeId = _recipe.map((recipe) => recipe.id).toList();
      // List _listRecipeName = _recipe.map((recipe) => recipe.name).toList();
      // List _listRecipeImage = _recipe.map((recipe) => recipe.image).toList();
      // List _listRecipeServings = _recipe.map((recipe) => recipe.servings).toList();

      // Rating
      List _listRatingId = _rating.map((rating) => rating.id).toList();
      List _listRatingRate = _rating.map((rating) => rating.rate).toList();
      // List _listRatingCustomerId =
      //     _rating.map((rating) => rating.customerId).toList();
      // List _listRatingRecipeId =
      //     _rating.map((rating) => rating.recipeId).toList();

      //   //print(_jsonListRecipe);
      //   apiRecommendation(_listRecipeId, _listRecipeName, _listRecipeImage, _listRecipeServings);
    } catch (e) {
      print(e.toString());
    }
  }

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
              title: Text('Hi, ${user.name}'),
              actions: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.shopping_cart),
                //   color: Colors.white,
                //   onPressed: () async {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Cart(uid: widget.uid),
                //       ),
                //     );
                //   },
                // ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  color: Colors.white,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileMenu(uid: widget.uid),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
            body: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 15),
                    child: Text(
                      'Find what you need',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 0.5,
                  height: MediaQuery.of(context).size.height / 17,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        height: 2.5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Divider(
                  thickness: 2.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                Text(
                  'Category List',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                //TODO: Infinite Scrolling
                Flexible(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardCategory(
                          title: 'Bakery/Bread',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionList(
                                  uid: '5FfFwRo7bML4sR8WBMcd',
                                  userId: user.uid,
                                ),
                              ),
                            );
                          },
                          image: 'assets/images/bakery_bread.png',
                        ),
                        CardCategory(
                          title: 'Milk',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionList(
                                  uid: 'btw068lPdzic4oHtRUGW',
                                  userId: user.uid,
                                ),
                              ),
                            );
                          },
                          image: 'assets/images/bakery_bread.png',
                        ),
                        CardCategory(
                          title: 'Fresh Fruits',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionList(
                                  uid: '15TqoZLABekkeMEUR9WI',
                                  userId: user.uid,
                                ),
                              ),
                            );
                          },
                          image: 'assets/images/bakery_bread.png',
                        ),
                        CardCategory(
                          title: 'Jam, Spreads & Honey',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PromotionList(
                                  uid: 'AbjCj6TDheRnapQ5wbza',
                                  userId: user.uid,
                                ),
                              ),
                            );
                          },
                          image: 'assets/images/bakery_bread.png',
                        ),
                      ],
                    ),
                  ),
                ),
                // FutureBuilder(
                //   future: getRecommendation(widget.uid),
                //   builder: (context, snapshot) {},
                // ),
                Center(
                  child: RaisedButton(
                    child: Text('Click API'),
                    onPressed: () {
                      getRecommendation(widget.uid);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 6),
                ),
              ],
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
