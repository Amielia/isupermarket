import 'package:isupermarket/components/rounded_button.dart';
import 'package:isupermarket/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:isupermarket/services/auth.dart';
import '../../constants.dart';

class RegisterCustomer extends StatefulWidget {
  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '',
      password = '',
      error = '',
      samePassword = '',
      name = '',
      phoneNum = '',
      gender = '',
      birthdate = '',
      address = '',
      city = '',
      state = '';
  int postcode = 0;

  @override
  Widget build(BuildContext context) {
    //TODO: Turunkan interface
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  validator: (val) => val.isEmpty ? 'Enter an name' : null,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your name',
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  validator: (val) => val.length < 6 ? 'Enter an email' : null,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  validator: (val) =>
                      val.length < 10 ? 'Enter a phone number' : null,
                  onChanged: (value) {
                    phoneNum = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your phone number',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (value) {
                    samePassword = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Re-enter the password',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Register',
                  onPressed: () async {
                    if (_formKey.currentState.validate() &&
                        samePassword == password) {
                      dynamic result = await _auth.registerCustomerInfo(
                          email.trim(),
                          password,
                          name,
                          phoneNum,
                          birthdate,
                          gender,
                          address,
                          city,
                          state,
                          postcode);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply valid email';
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Wrapper(),
                          ),
                        );
                      }
                    } else {
                      setState(() {
                        error = 'Password is not match';
                      });
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
