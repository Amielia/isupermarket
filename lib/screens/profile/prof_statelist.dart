import 'package:isupermarket/components/card_statelist.dart';
import 'package:isupermarket/models/users.dart';
import 'package:isupermarket/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditStateList extends StatefulWidget {
  EditStateList({this.uid, this.u});

  final String uid;
  final Users u;

  @override
  _EditStateListState createState() => _EditStateListState(u);
}

class _EditStateListState extends State<EditStateList> {
  Users _user;

  _EditStateListState(Users u) {
    this._user = u;
  }

  List<String> _state = [
    'Selangor',
    'Kuala Lumpur',
    'Johor',
    'Sarawak',
    'Sabah',
    'Perak',
    'Pulau Pinang',
    'Kedah',
    'Pahang',
    'Negeri Sembilan',
    'Kelantan',
    'Terengganu',
    'Melaka',
    'Putrajaya',
    'Perlis',
    'Labuan',
  ];

  TextEditingController _birthdate,
      _gender,
      _address,
      _city,
      _postcode,
      _password,
      _name,
      _phoneNum,
      _email;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: _user.name);
    _phoneNum = TextEditingController(text: _user.phoneNum);
    _email = TextEditingController(text: _user.email);
    _birthdate = TextEditingController(text: _user.birthdate);
    _gender = TextEditingController(text: _user.gender);
    _address = TextEditingController(text: _user.address);
    _city = TextEditingController(text: _user.city);
    _password = TextEditingController(text: _user.password);
    _postcode = TextEditingController(text: _user.postcode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Manage State'),
            ),
            body: ListView.builder(
              itemCount: _state.length,
              itemBuilder: (context, index) {
                return CardStateList(
                  title: _state[index],
                  onTap: () async {
                    await DatabaseService(uid: widget.uid).custInfo(
                        _email.text,
                        _password.text,
                        _name.text,
                        _phoneNum.text,
                        _birthdate.text,
                        _gender.text,
                        _address.text,
                        _city.text,
                        _state[index],
                        int.parse(_postcode.text));
                    Navigator.pop(context);
                  },
                );
              },
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
