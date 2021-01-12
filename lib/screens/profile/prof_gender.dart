import 'package:flutter/material.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/services/database_service.dart';

class EditGender extends StatefulWidget {
  EditGender({this.u, this.uid});

  final Users u;
  final String uid;

  @override
  _EditGenderState createState() => _EditGenderState(u);
}

class _EditGenderState extends State<EditGender> {
  Users _user;
  String _gender;

  _EditGenderState(Users u) {
    this._user = u;
  }

  TextEditingController _email,
      _birthdate,
      _name,
      _phoneNum,
      _address,
      _city,
      _postcode,
      _state,
      _password;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: _user.name);
    _phoneNum = TextEditingController(text: _user.phoneNum);
    _email = TextEditingController(text: _user.email);
    _birthdate = TextEditingController(text: _user.birthdate);
    _address = TextEditingController(text: _user.address);
    _city = TextEditingController(text: _user.city);
    _state = TextEditingController(text: _user.state);
    _password = TextEditingController(text: _user.password);
    _postcode = TextEditingController(text: _user.postcode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                child: Container(
                  child: Text(
                    'Male',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onTap: () async {
                  _gender = 'Male';
                  await DatabaseService(uid: widget.uid).custInfo(
                      _email.text,
                      _password.text,
                      _name.text,
                      _phoneNum.text,
                      _birthdate.text,
                      _gender.toString(),
                      _address.text,
                      _city.text,
                      _state.text,
                      int.parse(_postcode.text));
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                child: Container(
                  child: Text(
                    'Female',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onTap: () async {
                  _gender = 'Female';
                  await DatabaseService(uid: widget.uid).custInfo(
                    _email.text,
                    _password.text,
                    _name.text,
                    _phoneNum.text,
                    _birthdate.text,
                    _gender.toString(),
                    _address.text,
                    _city.text,
                    _state.text,
                    int.parse(_postcode.text),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
