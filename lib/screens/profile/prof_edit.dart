import 'package:isupermarket/components/rounded_button.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/services/auth.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:isupermarket/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfile extends StatefulWidget {
  EditProfile(
      {this.uid, this.title, this.hintText, this.value, this.validate, this.u});

  final String uid;
  final String title;
  final String hintText;
  final String value;
  final String validate;
  final Users u;

  @override
  _EditProfileState createState() => _EditProfileState(u);
}

class _EditProfileState extends State<EditProfile> {
  Users _user;

  _EditProfileState(Users u) {
    this._user = u;
  }

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  //TODO: Do error widget
  String error = '';

  TextEditingController _currentName,
      _currentPhoneNum,
      _currentEmail,
      _birthdate,
      _gender,
      _currentAddress,
      _currentCity,
      _state,
      _password,
      _currentPostcode,
      _value;

  @override
  void initState() {
    super.initState();
    _currentName = TextEditingController(text: _user.name);
    _currentPhoneNum = TextEditingController(text: _user.phoneNum);
    _currentEmail = TextEditingController(text: _user.email);
    _birthdate = TextEditingController(text: _user.birthdate);
    _gender = TextEditingController(text: _user.gender);
    _currentAddress = TextEditingController(text: _user.address);
    _currentCity = TextEditingController(text: _user.city);
    _state = TextEditingController(text: _user.state);
    _password = TextEditingController(text: _user.password);
    _currentPostcode = TextEditingController(text: _user.postcode.toString());
    _value = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _value,
                      //TODO: Validate email, phone number, name, postcode
                      validator: (value) =>
                          value.isEmpty ? widget.validate : null,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  RoundedButton(
                    colour: Colors.blue,
                    title: 'Save',
                    onPressed: () async {
                      setState(() {
                        if (widget.title == 'Edit Name') {
                          _currentName = _value;
                        } else if (widget.title == 'Edit Phone Number') {
                          _currentPhoneNum = _value;
                        } else if (widget.title == 'Edit Email') {
                          _currentEmail = _value;
                        } else if (widget.title == 'Edit Address') {
                          _currentAddress = _value;
                        } else if (widget.title == 'Edit City') {
                          _currentCity = _value;
                        } else if (widget.title == 'Edit Postcode') {
                          _currentPostcode = _value;
                        }
                      });

                      if (_formKey.currentState.validate() &&
                          widget.title == 'Edit Email') {
                        //TODO: Prevent from back to previous page
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Change Email'),
                            content: Text('Are you sure to change the email?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () async {
                                  bool status = await _auth.changeEmail(
                                      _currentEmail.text,
                                      _password.text,
                                      _currentName.text,
                                      _currentPhoneNum.text,
                                      _birthdate.text,
                                      _gender.text,
                                      _currentAddress.text,
                                      _currentCity.text,
                                      _state.text,
                                      int.parse(_currentPostcode.text));

                                  if (status) {
                                    await _auth.signOut();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Wrapper(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                            elevation: 24.0,
                          ),
                          barrierDismissible: false,
                        );
                      } else if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: widget.uid).custInfo(
                          _currentEmail.text,
                          _password.text,
                          _currentName.text,
                          _currentPhoneNum.text,
                          _birthdate.text,
                          _gender.text,
                          _currentAddress.text,
                          _currentCity.text,
                          _state.text,
                          int.parse(_currentPostcode.text),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
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
