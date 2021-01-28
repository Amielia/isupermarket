import 'package:flutter/material.dart';
import 'package:isupermarket/screens/home5.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/wrapper.dart';
import 'package:isupermarket/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(isupermarket());
}

class isupermarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'isupermarket',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: '/home',
        // routes: {
        //   '/home': (context) => Home(),
        //   '/existing-cards': (context) => ExistingCardsPage()
        // }
        home: Wrapper(),
      ),
    );
  }
}
