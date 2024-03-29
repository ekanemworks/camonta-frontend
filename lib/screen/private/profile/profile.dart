import 'dart:convert';

import 'package:camonta/screen/private/profile/profile_types/profile_chef.dart';
import 'package:camonta/screen/private/profile/profile_types/profile_customer.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  var _editedProfile;
  Map _userData = {
    'id': 0,
    'profileType': '',
    'profileSession': '',
    'profileName': '',
    'profileUsername': '',
    'profilePhoto': '',
    'profileBio': '',
    'profileEmail': '',
    'profileEmailStatus': '',
    'password': '',
    'registrationDate': '',
    'notification': '',
    'myProductCount': '',
    'myPurchase': '',
    'profileLikeForIdList': [],
    'profileLikeByIdList': [],
    'profileServes': '',
    'profilePoints': '',
  };
  @override
  void initState() {
    // use session management class to set session
    // use session management class to set session
    callSession();
    super.initState();
  }

  callSession() {
    // use session management class to set session
    // use session management class to set session
    sessionMgt.getSession().then(
          (value) => {
            setState(() {
              // decode
              _userData = json.decode(value);
              // print(_userData);
            }),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    if (_userData['profileType'] == 'Customer') {
      return ProfileCustomer();
    } else {
      return ProfileChef();
    }
  }
}
