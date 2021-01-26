// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'package:egroceryapp/models/carts.dart';
// // import 'package:egroceryapp/models/categories.dart';
// // import 'package:egroceryapp/models/cuisines.dart';
// // import 'package:egroceryapp/models/instructions.dart';
// // import 'package:egroceryapp/models/products.dart';
// // import 'package:egroceryapp/models/ratings.dart';
// // import 'package:egroceryapp/models/recipes.dart';
// // import 'package:egroceryapp/screens/cart/cart.dart';
// import 'package:isupermarket/models/products.dart';
// import 'package:isupermarket/models/ratings.dart';
// import 'package:isupermarket/models/beacons.dart';
// import 'package:isupermarket/models/promotionpc.dart';
// // import 'package:isupermarket/screens/cart/cart.dart';
// // import 'package:isupermarket/models/cart.dart';

// class DBQuery {
//   //Collection Reference (Products)
//   final CollectionReference _productsCollection =
//       FirebaseFirestore.instance.collection('Products');

//   // //Collection Reference (Promotion Personal Care)
//   // final CollectionReference _promotionpcCollection =
//   //     FirebaseFirestore.instance.collection('Promotionpc');

//   // //Collection Reference (Promotion Grocery)
//   // final CollectionReference _promotiongrCollection =
//   //     FirebaseFirestore.instance.collection('Promotiongr');

//   // //Collection Reference (Ratings)
//   // final CollectionReference _ratingsCollection =
//   //     FirebaseFirestore.instance.collection('Ratings');

//   //Collection Reference (Beacon)
//   final CollectionReference _beaconsCollection =
//       FirebaseFirestore.instance.collection('beacon');

//   //Collection Reference (Grocery)
//   final CollectionReference _groceryCollection =
//       FirebaseFirestore.instance.collection('Products');

//   //Collection Reference (Frozen Food)
//   // final CollectionReference _frozenCollection =
//   //     FirebaseFirestore.instance.collection('Products');

//   // //Collection Reference (Beauty)
//   // final CollectionReference _beautyCollection =
//   //     FirebaseFirestore.instance.collection('Products');

//   //Collection Reference (Personal Care)
//   final CollectionReference _personalcareCollection =
//       FirebaseFirestore.instance.collection('Products');

//   //Collection Reference (Carts)
//   // final CollectionReference _cartsCollection =
//   // FirebaseFirestore.instance.collection('Carts');

//   //Get Ratings List of User
//   // Future getRatingsList(String user) async {
//   //   try {
//   //     QuerySnapshot snapshot =
//   //         await _ratingsCollection.where('userId', isEqualTo: user).get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Ratings(
//   //             id: e.get('id'),
//   //             rate: e.get('rate'),
//   //             userId: e.get('userId'),
//   //             // recipeId: e.get('recipe_id'),
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Get One Grocery Food Data from Snapshot
//   Future personalcareDetails(String id) async {
//     try {
//       final DocumentSnapshot snapshot =
//           await _personalcareCollection.doc(id).get();
//       return Products(
//         uid: snapshot.get('id'),
//         name: snapshot.get('name'),
//         price: snapshot.get('price'),
//         url: snapshot.get('url'),
//         description: snapshot.get('description'),
//         category: snapshot.get('category'),
//         // quantity: snapshot.get('quantity'),
//         // mainCategoryId: snapshot.get('main_category_id'),
//         // subCategoryId: snapshot.get('sub_category_id'),
//       );
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // Get All Products Grocery Food Data from Snapshot
//   Future<List<Products>> personalcareList(String id) async {
//     try {
//       final QuerySnapshot snapshot = await _personalcareCollection
//           .where('category', isEqualTo: "personalcare")
//           .get();

//       return snapshot.docs
//           .map(
//             (e) => Products(
//               uid: e.id,
//               category: e.get('category') ?? '',
//               name: e.get('name') ?? '',
//               price: e.get('price') ?? 0.00,
//               description: e.get('description') ?? '',
//               url: e.get('url') ?? '',
//               // mainCategoryId: e.get('main_category_id') ?? '',
//               // subCategoryId: e.get('sub_category_id') ?? '',
//             ),
//           )
//           .toList();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // Get One Frozen Food Data from Snapshot
//   // Future frozenDetails(String id) async {
//   //   try {
//   //     final DocumentSnapshot snapshot = await _frozenCollection.doc(id).get();
//   //     return Products(
//   //       uid: snapshot.get('id'),
//   //       name: snapshot.get('name'),
//   //       price: snapshot.get('price'),
//   //       url: snapshot.get('url'),
//   //       description: snapshot.get('description'),
//   //       category: snapshot.get('category'),
//   //       // quantity: snapshot.get('quantity'),
//   //       // mainCategoryId: snapshot.get('main_category_id'),
//   //       // subCategoryId: snapshot.get('sub_category_id'),
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Get All Products Frozen Food Data from Snapshot
//   // Future<List<Products>> frozenList(String id) async {
//   //   try {
//   //     final QuerySnapshot snapshot =
//   //         await _frozenCollection.where('category', isEqualTo: "frozen").get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Products(
//   //             uid: e.id,
//   //             category: e.get('category') ?? '',
//   //             name: e.get('name') ?? '',
//   //             price: e.get('price') ?? 0.00,
//   //             description: e.get('description') ?? '',
//   //             url: e.get('url') ?? '',
//   //             // mainCategoryId: e.get('main_category_id') ?? '',
//   //             // subCategoryId: e.get('sub_category_id') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Get One Beauty Data from Snapshot
//   // Future beautyDetails(String id) async {
//   //   try {
//   //     final DocumentSnapshot snapshot = await _beautyCollection.doc(id).get();
//   //     return Products(
//   //       uid: snapshot.get('id'),
//   //       name: snapshot.get('name'),
//   //       price: snapshot.get('price'),
//   //       url: snapshot.get('url'),
//   //       description: snapshot.get('description'),
//   //       category: snapshot.get('category'),
//   //       // quantity: snapshot.get('quantity'),
//   //       // mainCategoryId: snapshot.get('main_category_id'),
//   //       // subCategoryId: snapshot.get('sub_category_id'),
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Get All Products Beauty Data from Snapshot
//   // Future<List<Products>> beautyList(String id) async {
//   //   try {
//   //     final QuerySnapshot snapshot =
//   //         await _beautyCollection.where('category', isEqualTo: "beauty").get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Products(
//   //             uid: e.id,
//   //             category: e.get('category') ?? '',
//   //             name: e.get('name') ?? '',
//   //             price: e.get('price') ?? 0.00,
//   //             description: e.get('description') ?? '',
//   //             url: e.get('url') ?? '',
//   //             // mainCategoryId: e.get('main_category_id') ?? '',
//   //             // subCategoryId: e.get('sub_category_id') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // Get One promotion pc Data from Snapshot
//   // Future promotionpcDetails(String id) async {
//   //   try {
//   //     final DocumentSnapshot snapshot =
//   //         await _promotionpcCollection.doc(id).get();
//   //     return Promotionpc(
//   //       uid: snapshot.get('id'),
//   //       name: snapshot.get('name'),
//   //       price: snapshot.get('price'),
//   //       url: snapshot.get('url'),
//   //       description: snapshot.get('description'),
//   //       // category: snapshot.get('category'),
//   //       // quantity: snapshot.get('quantity'),
//   //       // mainCategoryId: snapshot.get('main_category_id'),
//   //       // subCategoryId: snapshot.get('sub_category_id'),
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // // Get All promotion pc Data from Snapshot
//   // Future<List<Promotionpc>> promotionpcList(String id) async {
//   //   try {
//   //     final QuerySnapshot snapshot = await _promotionpcCollection
//   //         .where('category', isEqualTo: "Personal Care")
//   //         .get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Promotionpc(
//   //             uid: e.id,
//   //             category: e.get('category') ?? '',
//   //             name: e.get('name') ?? '',
//   //             price: e.get('price') ?? 0.00,
//   //             description: e.get('description') ?? '',
//   //             url: e.get('url') ?? '',
//   //             // mainCategoryId: e.get('main_category_id') ?? '',
//   //             // subCategoryId: e.get('sub_category_id') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Get One grocery Details from Snapshot
//   Future groceryDetails(uid) async {
//     try {
//       final DocumentSnapshot snapshot = await _groceryCollection.doc(uid).get();
//       return Products(
//         uid: uid,
//         category: snapshot.get('category') ?? '',
//         name: snapshot.get('name') ?? '',
//         price: snapshot.get('price') ?? '',
//         description: snapshot.get('description') ?? '',
//         url: snapshot.get('url') ?? '',
//       );
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   //Get All grocery from Snapshot via Beacon
//   Future groceryList(String uid) async {
//     try {
//       QuerySnapshot snapshot = await _groceryCollection
//           .where('beaconId', isEqualTo: 'b9407f30-f5f8-466e-aff9-25556b57fe6a')
//           .get();

//       return snapshot.docs
//           .map(
//             (e) => Products(
//               uid: e.id,
//               category: e.get('category'),
//               name: e.get('name') ?? '',
//               price: e.get('price') ?? '',
//               description: e.get('description') ?? '',
//               url: e.get('url') ?? '',
//             ),
//           )
//           .toList();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   // //Get One pc Details from Snapshot
//   // Future personalcareDetails(uid) async {
//   //   try {
//   //     final DocumentSnapshot snapshot =
//   //         await _personalcareCollection.doc(uid).get();
//   //     return Products(
//   //       uid: uid,
//   //       category: snapshot.get('category') ?? '',
//   //       name: snapshot.get('name') ?? '',
//   //       price: snapshot.get('price') ?? '',
//   //       description: snapshot.get('description') ?? '',
//   //       url: snapshot.get('url') ?? '',
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get All ps from Snapshot via Beacon
//   // Future personalcareList(String uid) async {
//   //   try {
//   //     QuerySnapshot snapshot = await _personalcareCollection
//   //         .where('beaconId', isEqualTo: 'b9407f30-f5f8-466e-aff9-25556b57fe6b')
//   //         .get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Products(
//   //             uid: e.id,
//   //             category: e.get('category'),
//   //             name: e.get('name') ?? '',
//   //             price: e.get('price') ?? '',
//   //             description: e.get('description') ?? '',
//   //             url: e.get('url') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Beacon
//   Future<List<Beacons>> beaconList(String uid) async {
//     try {
//       final QuerySnapshot snapshot = await _beaconsCollection.get();

//       return snapshot.docs
//           .map(
//             (e) => Beacons(
//                 uid: uid,
//                 // proximityUUID: e.get('proximityUUID') ?? '',
//                 beaconId: e.get('beaconId') ?? '',
//                 major: e.get('major') ?? '',
//                 minor: e.get('minor') ?? '',
//                 name: e.get('name') ?? ''),
//           )
//           .toList();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   //Add Groceries for Confirmation Purchase
//   // Future addGroceries(String custId, String orderId) async {
//   //   try {
//   //     QuerySnapshot snapshot =
//   //         await _cartsCollection.where('customer_id', isEqualTo: custId).get();

//   //     List<Carts> _cart = snapshot.docs
//   //         .map(
//   //           (e) => Carts(
//   //             id: e.get('id'),
//   //             customerId: e.get('customer_id'),
//   //             productId: e.get('product_id'),
//   //             quantity: e.get('quantity'),
//   //           ),
//   //         )
//   //         .toList();

//   //     for (int i = 0; i < _cart.length; i++) {
//   //       String refId = _groceriesCollection.doc().id;
//   //       await _groceriesCollection.doc(refId).set({
//   //         'id': refId,
//   //         'order_id': orderId,
//   //         'product_id': _cart[i].productId,
//   //       });
//   //     }

//   //     //Delete Cart after the products insert to Groceries Collection
//   //     deleteCart(custId);
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Add Transactions and Orders Collection
//   // Future addTransactionsAndOrders(
//   //     String paymentIntentId, double amount, String time, String custId) async {
//   //   String refIdTransaction = _transactionsCollection.doc().id;
//   //   String refIdOrder = _ordersCollection.doc().id;

//   //   try {
//   //     await _transactionsCollection.doc(refIdTransaction).set({
//   //       'id': refIdTransaction,
//   //       'payment_intent_id': paymentIntentId,
//   //       'amount': amount,
//   //       'timestamp': time,
//   //     });
//   //     await _ordersCollection.doc(refIdOrder).set({
//   //       'id': refIdOrder,
//   //       'timestamp': time,
//   //       'total_price': amount,
//   //       'status': 'Pending',
//   //       'customer_id': custId,
//   //       'transaction_id': refIdTransaction,
//   //     });

//   //     await addGroceries(custId, refIdOrder);
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Total Price in Cart
//   // Future totalPrice(String id) async {
//   //   Products _products;
//   //   double _price = 0.0;
//   //   double _price2 = 0.0;
//   //   try {
//   //     QuerySnapshot snapshot =
//   //         await _cartsCollection.where('customer_id', isEqualTo: id).get();

//   //     List<Carts> _cart = snapshot.docs
//   //         .map(
//   //           (e) => Carts(
//   //             id: e.get('id'),
//   //             customerId: e.get('customer_id'),
//   //             productId: e.get('product_id'),
//   //             quantity: e.get('quantity'),
//   //           ),
//   //         )
//   //         .toList();

//   //     for (int i = 0; i < _cart.length; i++) {
//   //       if (i < _cart.length) {
//   //         _products = await productDetail(_cart[i].productId);
//   //         _price = _cart[i].quantity * _products.price;
//   //         _price2 = _price + _price2;
//   //       }
//   //     }
//   //     return _price2;
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   //Update Quantity Item in Cart
//   //
//   //View List of Carts
//   // Future cartsList(String custId) async {
//   //   try {
//   //     QuerySnapshot snapshot =
//   //         await _cartsCollection.where('customer_id', isEqualTo: custId).get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Carts(
//   //             id: e.get('id'),
//   //             customerId: e.get('customer_id'),
//   //             productId: e.get('product_id'),
//   //             quantity: e.get('quantity'),
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // Future productDetailCarts(String id) async {
//   //   try {
//   //     QuerySnapshot snapshotProducts =
//   //         await _productsCollection.where('id', isEqualTo: id).get();

//   //     return snapshotProducts.docs
//   //         .map(
//   //           (e) => Products(
//   //             uid: e.get('id'),
//   //             image: e.get('image'),
//   //             mainCategoryId: e.get('main_category_id'),
//   //             name: e.get('name'),
//   //             price: e.get('price'),
//   //             quantity: e.get('quantity'),
//   //             subCategoryId: e.get('sub_category_id'),
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Delete Cart
//   // Future deleteCart(String id) async {
//   //   _cartsCollection.doc(id).delete();
//   // }

//   //Add Product to Cart
//   // Future addProductToCart(String custId, String productId, int quantity) async {
//   //   String refId = _cartsCollection.doc().id;

//   //   try {
//   //     QuerySnapshot snapshot = await _cartsCollection
//   //         .where('product_id', isEqualTo: productId)
//   //         .where('customer_id', isEqualTo: custId)
//   //         .get();

//   //     if (snapshot.size == 0) {
//   //       await _cartsCollection.doc(refId).set({
//   //         'id': refId,
//   //         'customer_id': custId,
//   //         'product_id': productId,
//   //         'quantity': quantity,
//   //       });
//   //     } else {
//   //       QuerySnapshot snapshot = await _cartsCollection
//   //           .where('product_id', isEqualTo: productId)
//   //           .where('customer_id', isEqualTo: custId)
//   //           .limit(1)
//   //           .get();

//   //       DocumentSnapshot documentSnapshot = snapshot.docs.first;
//   //       final userDocId = documentSnapshot.id;

//   //       _cartsCollection.doc(userDocId).update({
//   //         'quantity': quantity,
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get Ingredients Data
//   // Future ingredientsList(String id) async {
//   //   try {
//   //     QuerySnapshot snapshot =
//   //         await _cuisinesCollection.where('recipe_id', isEqualTo: id).get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Cuisines(
//   //             id: e.get('id') ?? '',
//   //             subCategoryId: e.get('sub_category_id') ?? '',
//   //             quantity: e.get('quantity') ?? '',
//   //             recipeId: e.get('recipe_id') ?? '',
//   //             detail: e.get('detail') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // Future recipeDetail(String id) async {
//   //   try {
//   //     final DocumentSnapshot snapshot = await _recipesCollection.doc(id).get();
//   //     return Recipes(
//   //       id: snapshot.get('id'),
//   //       name: snapshot.get('recipe_name'),
//   //       image: snapshot.get('image'),
//   //       servings: snapshot.get('servings'),
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get All Recipes Data from Snapshot
//   // Future recipesList() async {
//   //   try {
//   //     final QuerySnapshot snapshot = await _recipesCollection.get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Recipes(
//   //             id: e.get('id') ?? '',
//   //             image: e.get('image') ?? '',
//   //             name: e.get('recipe_name') ?? '',
//   //             servings: e.get('servings') ?? 0,
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get All Instruction
//   // Future instructionList(String id) async {
//   //   try {
//   //     final QuerySnapshot snapshot = await _instructionsCollection
//   //         .where('recipe_id', isEqualTo: id)
//   //         .orderBy('step')
//   //         .get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Instructions(
//   //             id: e.get('id'),
//   //             description: e.get('description'),
//   //             recipeId: e.get('recipe_id'),
//   //             step: e.get('step'),
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get Products Data for Recipe Detail
//   // Future<List<Categories>> getCategoriesForRecipe(String id) async {
//   //   try {
//   //     final QuerySnapshot snapshot =
//   //         await _categoriesCollection.where('id', isEqualTo: id).get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Categories(
//   //             id: e.get('id'),
//   //             name: e.get('category_name'),
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // Future productlist(String id) async {
//   //   try {
//   //     final DocumentSnapshot snapshot = await _productsCollection.doc(id).get();
//   //     return Products(
//   //       uid: snapshot.get('id'),
//   //       name: snapshot.get('name'),
//   //       price: snapshot.get('price'),
//   //       url: snapshot.get('url'),
//   //       description: snapshot.get('description'),
//   //       // quantity: snapshot.get('quantity'),
//   //       // mainCategoryId: snapshot.get('main_category_id'),
//   //       // subCategoryId: snapshot.get('sub_category_id'),
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get One Book Data from Snapshot
//   // Future bookDetail(uid) async {
//   //   try {
//   //     final DocumentSnapshot snapshot = await _booksCollection.doc(uid).get();
//   //     return Books(
//   //       uid: uid,
//   //       title: snapshot.get('title') ?? '',
//   //       author: snapshot.get('author') ?? '',
//   //       category: snapshot.get('category') ?? '',
//   //       shelves: snapshot.get('shelves') ?? '',
//   //       url: snapshot.get('url') ?? '',
//   //       synopsis: snapshot.get('synopsis') ?? '',
//   //     );
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get All book level 1 Data
//   // Future bookLevel1(String uid) async {
//   //   try {
//   //     QuerySnapshot snapshot = await _booksCollection
//   //         .where('beaconId', isEqualTo: 'b9407f30-f5f8-466e-aff9-25556b57fe6a')
//   //         .get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Books(
//   //             uid: e.id,
//   //             title: e.get('title') ?? '',
//   //             author: e.get('author') ?? '',
//   //             category: e.get('category') ?? '',
//   //             synopsis: e.get('synopsis') ?? '',
//   //             url: e.get('url') ?? '',
//   //             shelves: e.get('shelves') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   // //Get All book level 2 Data
//   // Future bookLevel2(String uid) async {
//   //   try {
//   //     QuerySnapshot snapshot = await _booksCollection
//   //         .where('beaconId', isEqualTo: 'b9407f30-f5f8-466e-aff9-25556b57fe6b')
//   //         .get();

//   //     return snapshot.docs
//   //         .map(
//   //           (e) => Books(
//   //             uid: e.id,
//   //             title: e.get('title') ?? '',
//   //             author: e.get('author') ?? '',
//   //             category: e.get('category') ?? '',
//   //             synopsis: e.get('synopsis') ?? '',
//   //             url: e.get('url') ?? '',
//   //             shelves: e.get('shelves') ?? '',
//   //           ),
//   //         )
//   //         .toList();
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }
// }
