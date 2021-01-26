import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isupermarket/models/products.dart';
import 'package:isupermarket/models/beacons.dart';

class DBQuery {
  // //Collection Reference (Products)
  // final CollectionReference _productsCollection =
  //     FirebaseFirestore.instance.collection('Products');

  //Collection Reference (Beacon)
  final CollectionReference _beaconsCollection =
      FirebaseFirestore.instance.collection('beacon');

  //Collection Reference (Grocery)
  final CollectionReference _groceryCollection =
      FirebaseFirestore.instance.collection('Products');

  //Collection Reference (Grocery)
  final CollectionReference _promotiongrCollection =
      FirebaseFirestore.instance.collection('Products');

  //Collection Reference (Personal Care)
  final CollectionReference _promotionpcCollection =
      FirebaseFirestore.instance.collection('Products');

  //Collection Reference (Personal Care)
  final CollectionReference _personalcareCollection =
      FirebaseFirestore.instance.collection('Products');

  ///////////////////////////////////////////////////PROMOTION GROCERY//////////////////////////////////////////////////////

  //Get One PROMOTION GROCERY Data from Snapshot
  Future promotiongrDetails(String id) async {
    try {
      final DocumentSnapshot snapshot =
          await _promotiongrCollection.doc(id).get();
      return Products(
        uid: snapshot.get('id'),
        beaconName: snapshot.get('beaconName'),
        category: snapshot.get('category'),
        description: snapshot.get('description'),
        name: snapshot.get('name'),
        price: snapshot.get('price'),
        promotion: snapshot.get('promotion'),
        shelves: snapshot.get('shelves'),
        url: snapshot.get('url'),

        // quantity: snapshot.get('quantity'),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // Get All Promotion from grocery
  Future promotiongrList() async {
    try {
      final QuerySnapshot snapshot = await _promotiongrCollection
          .where('promotion', isEqualTo: 'Yes')
          .where('category', isEqualTo: 'Grocery')
          .get();

      return snapshot.docs
          .map(
            (e) => Products(
              uid: e.get('id'),
              beaconName: e.get('beaconName') ?? '',
              category: e.get('category') ?? '',
              description: e.get('description') ?? '',
              name: e.get('name') ?? '',
              price: e.get('price') ?? 0.00,
              promotion: e.get('promotion') ?? '',
              shelves: e.get('shelves') ?? '',
              url: e.get('url') ?? '',
            ),
          )
          .toList();
    } catch (e) {
      print('error ' + e.toString());
    }
  }

  ///////////////////////////////////////////////////PROMOTION PERSONAL CARE//////////////////////////////////////////////////////

  //Get One PROMOTION GROCERY Data from Snapshot
  Future promotionpcDetails(String id) async {
    try {
      final DocumentSnapshot snapshot =
          await _promotionpcCollection.doc(id).get();
      return Products(
        uid: id,
        beaconName: snapshot.get('beaconName'),
        category: snapshot.get('category'),
        description: snapshot.get('description'),
        name: snapshot.get('name'),
        price: snapshot.get('price'),
        promotion: snapshot.get('promotion'),
        shelves: snapshot.get('shelves'),
        url: snapshot.get('url'),

        // quantity: snapshot.get('quantity'),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  // Get All Promotion from grocery
  Future promotionpcList() async {
    try {
      final QuerySnapshot snapshot = await _promotionpcCollection
          .where('category', isEqualTo: 'Personal Care')
          .where('promotion', isEqualTo: 'Yes')
          .get();

      return snapshot.docs
          .map(
            (e) => Products(
              uid: e.get('id'),
              beaconName: e.get('beaconName') ?? '',
              category: e.get('category') ?? '',
              description: e.get('description') ?? '',
              name: e.get('name') ?? '',
              price: e.get('price'),
              promotion: e.get('promotion') ?? '',
              shelves: e.get('shelves') ?? '',
              url: e.get('url') ?? '',
            ),
          )
          .toList();
    } catch (e) {
      print('error ' + e.toString());
    }
  }

  //////////////////////////////////////////////////////BEACON GROCERY/////////////////////////////////////////////////////

  //Get One grocery Details from Snapshot for Beacon
  Future groceryDetails(uid) async {
    try {
      final DocumentSnapshot snapshot = await _groceryCollection.doc(uid).get();
      return Products(
        uid: uid,
        beaconName: snapshot.get('beaconName'),
        category: snapshot.get('category') ?? '',
        description: snapshot.get('description') ?? '',
        name: snapshot.get('name') ?? '',
        price: snapshot.get('price') ?? 0.00,
        promotion: snapshot.get('promotion') ?? '',
        shelves: snapshot.get('shelves') ?? '',
        url: snapshot.get('url') ?? '',
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //Get All GROCERY from Snapshot via Beacon
  Future groceryList(String uid) async {
    try {
      QuerySnapshot snapshot = await _groceryCollection
          .where('beaconName', isEqualTo: 'Groceries')
          .get();

      return snapshot.docs
          .map(
            (e) => Products(
              uid: e.id,
              beaconName: e.get('beaconName'),
              category: e.get('category') ?? '',
              description: e.get('description') ?? '',
              name: e.get('name') ?? '',
              price: e.get('price') ?? 0.00,
              promotion: e.get('promotion') ?? '',
              shelves: e.get('shelves') ?? '',
              url: e.get('url') ?? '',
            ),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  //////////////////////////////////////////////////////BEACON PERSONAL CARE//////////////////////////////////////////////////////
  //Get One Personal Care Details from Snapshot for Beacon
  Future personalcareDetails(uid) async {
    print(uid);
    try {
      final DocumentSnapshot snapshot =
          await _personalcareCollection.doc(uid).get();
      return Products(
        uid: uid,
        beaconName: snapshot.get('beaconName'),
        category: snapshot.get('category') ?? '',
        description: snapshot.get('description') ?? '',
        name: snapshot.get('name') ?? '',
        price: snapshot.get('price') ?? 0.00,
        promotion: snapshot.get('promotion') ?? '',
        shelves: snapshot.get('shelves') ?? '',
        url: snapshot.get('url') ?? '',
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //Get All GROCERY from Snapshot via Beacon
  Future personalcareList(String uid) async {
    try {
      QuerySnapshot snapshot = await _personalcareCollection
          .where('beaconName', isEqualTo: 'Personal Care')
          .get();

      return snapshot.docs
          .map(
            (e) => Products(
              uid: e.id,
              beaconName: e.get('beaconName'),
              category: e.get('category') ?? '',
              description: e.get('description') ?? '',
              name: e.get('name') ?? '',
              price: e.get('price') ?? 0.00,
              promotion: e.get('promotion') ?? '',
              shelves: e.get('shelves') ?? '',
              url: e.get('url') ?? '',
            ),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  //////////////////////////////////////////////////////XXXXXXXX//////////////////////////////////////////////////////

  //Beacon
  Future<List<Beacons>> beaconList(String uid) async {
    try {
      final QuerySnapshot snapshot = await _beaconsCollection.get();

      return snapshot.docs
          .map(
            (e) => Beacons(
                uid: uid,
                beaconId: e.get('beaconId') ?? '',
                major: e.get('major') ?? '',
                minor: e.get('minor') ?? '',
                beaconName: e.get('beaconName') ?? ''),
          )
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }
}
