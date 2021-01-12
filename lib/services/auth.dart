import 'package:isupermarket/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isupermarket/models/users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object based on Firebase User
  Users _userFromFirebase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //Auth Change User Stream
  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //Sign In with Email & Password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future changeEmail(
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
    bool status = true;
    try {
      User user = _auth.currentUser;
      await user.updateEmail(email);

      await DatabaseService(uid: user.uid).custInfo(
          _auth.currentUser.email,
          password,
          name,
          phoneNum,
          birthdate,
          gender,
          address,
          city,
          state,
          postcode);
      return status;
    } catch (e) {
      print(e.toString());
    }
  }

  //Register with Email & Password
  Future registerCustomerInfo(
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
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).registerCustomer(
          user.email,
          password,
          name,
          phoneNum,
          birthdate,
          gender,
          address,
          city,
          state,
          postcode);
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
