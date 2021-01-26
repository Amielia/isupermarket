import 'package:isupermarket/components/card_profile.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/screens/profile/prof_gender.dart';
import 'package:isupermarket/screens/profile/prof_edit.dart';
import 'package:isupermarket/screens/profile/prof_verifypass.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class UserProfile extends StatefulWidget {
  UserProfile({this.uid, this.u});

  final String uid;
  final Users u;

  @override
  _UserProfileState createState() => _UserProfileState(u);
}

class _UserProfileState extends State<UserProfile> {
  Users _user;

  _UserProfileState(Users u) {
    this._user = u;
  }

  TextEditingController _email,
      _name,
      _phoneNum,
      _address,
      _city,
      _postcode,
      _state,
      _password,
      _gender;

  DateTime now = DateTime.now();
  DateTime _date;
  final _dateFormat = DateFormat('dd-MM-yyyy');
  String _dateString = '';

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: _user.name);
    _phoneNum = TextEditingController(text: _user.phoneNum);
    _email = TextEditingController(text: _user.email);
    _gender = TextEditingController(text: _user.gender);
    _address = TextEditingController(text: _user.address);
    _city = TextEditingController(text: _user.city);
    _state = TextEditingController(text: _user.state);
    _password = TextEditingController(text: _user.password);
    _postcode = TextEditingController(text: _user.postcode.toString());
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(Widget widget) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 60.0,
            ),
            height: 200.0,
            child: widget,
          );
        },
      );
    }

    Future<DateTime> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1950),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != now) {
        now = picked;
      }
      return now;
    }

    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users usersData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Manage Profile'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //TODO: Add image
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/icon.png'),
                        radius: 40.0,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Divider(
                        thickness: 15.0,
                        color: Colors.grey,
                      ),
                      Column(
                        children: <Widget>[
                          CardProfile(
                            title: 'Name',
                            data: usersData.name,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: widget.uid,
                                    title: 'Edit Name',
                                    hintText: 'Enter a name',
                                    value: usersData.name,
                                    validate: 'Please enter a name',
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Phone Number',
                            data: usersData.phoneNum,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: widget.uid,
                                    title: 'Edit Phone Number',
                                    hintText: 'Enter your phone number',
                                    value: usersData.phoneNum,
                                    validate: 'Please enter a phone number',
                                    u: usersData,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Email',
                            data: usersData.email,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyPasswordForEmail(
                                    uid: widget.uid,
                                    title: 'Verify Password',
                                    hintText: 'Current Password',
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Gender',
                            data: usersData.gender,
                            onPressed: () => _showSettingsPanel(
                              EditGender(
                                u: usersData,
                                uid: usersData.uid,
                              ),
                            ),
                          ),
                          CardProfile(
                            title: 'Birth Date',
                            data: usersData.birthdate,
                            onPressed: () async {
                              _date = await _selectDate(context);
                              _dateString = _dateFormat.format(_date);
                              //print(_dateString);
                              await DatabaseService(uid: widget.uid).custInfo(
                                _email.text,
                                _password.text,
                                _name.text,
                                _phoneNum.text,
                                _dateString,
                                _gender.text,
                                _address.text,
                                _city.text,
                                _state.text,
                                int.parse(_postcode.text),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
