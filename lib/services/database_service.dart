import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isupermarket/models/users.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //Collection Reference (Users)
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

  //Register Customer Info
  Future registerCustomer(
      String email,
      String password,
      String name,
      String phoneNum,
      String birthdate,
      String gender,
      String address,
      String city,
      String state,
      int postcode) async {
    var bytes = utf8.encode(password);
    var passwordEncode = base64.encode(bytes);

    await _usersCollection.doc(uid).set({
      'id': uid,
      'name': name,
      'email': email,
      'phone_number': phoneNum,
      'birthdate': birthdate,
      'gender': gender,
      'address': address,
      'city': city,
      'state': state,
      'postcode': postcode,
      'password': passwordEncode,
    });
  }

  //Update Customer Info
  Future custInfo(
      String email,
      String password,
      String name,
      String phoneNum,
      String birthdate,
      String gender,
      String address,
      String city,
      String state,
      int postcode) async {
    String pass;

    try {
      await _usersCollection.doc(uid).get().then((value) {
        pass = value.get('password');

        if (password == pass) {
          return _usersCollection.doc(uid).set({
            'id': uid,
            'name': name,
            'email': email,
            'phone_number': phoneNum,
            'birthdate': birthdate,
            'gender': gender,
            'address': address,
            'city': city,
            'state': state,
            'postcode': postcode,
            'password': password,
          });
        } else {
          var bytes = utf8.encode(password);
          var passwordEncode = base64.encode(bytes);

          return _usersCollection.doc(uid).set({
            'id': uid,
            'name': name,
            'email': email,
            'phone_number': phoneNum,
            'birthdate': birthdate,
            'gender': gender,
            'address': address,
            'city': city,
            'state': state,
            'postcode': postcode,
            'password': passwordEncode,
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //Checking Password
  Future checkPassword(String password) async {
    bool status = false;
    try {
      await _usersCollection.doc(uid).get().then((value) {
        var decode = utf8.decode(base64.decode(value.get('password')));
        if (password == decode) {
          status = true;
        } else {
          status = false;
        }
      });
      return status;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //Get User Data from Snapshot
  Users _usersDataFromSnapshot(DocumentSnapshot snapshot) {
    return Users(
      uid: uid,
      name: snapshot.get('name') ?? '',
      phoneNum: snapshot.get('phone_number') ?? '',
      email: snapshot.get('email') ?? '',
      birthdate: snapshot.get('birthdate') ?? '',
      gender: snapshot.get('gender') ?? '',
      address: snapshot.get('address') ?? '',
      city: snapshot.get('city') ?? '',
      state: snapshot.get('state') ?? '',
      postcode: snapshot.get('postcode') ?? 0,
      password: snapshot.get('password') ?? '',
    );
  }

  //Get User Document Stream
  Stream<Users> get userData {
    return _usersCollection.doc(uid).snapshots().map(_usersDataFromSnapshot);
  }
}
