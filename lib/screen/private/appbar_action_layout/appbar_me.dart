import 'dart:convert';

import 'package:camonta/screen/private/notification/notification.dart';
import 'package:camonta/screen/private/profile/profile.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class AppbarMe extends StatefulWidget {
  @override
  _AppbarMeState createState() => _AppbarMeState();
}

class _AppbarMeState extends State<AppbarMe> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();

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
    'profileCountry': '',
    'profileState': '',
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
            }),
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            border: Border.all(width: 1, color: Color(0xffB80247)),
            // color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff9F033E), Color(0xff7F0131)],
            ),
          ),
          padding: EdgeInsets.only(left: 5, right: 5),
          margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                ),
                // color: Colors.purple,
                // child: Image.asset('assets/default.png'),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: _userData['profilePhoto'] == ''
                      ? Image.asset(
                          'assets/default_dp.png',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          httpService.serverAPI + _userData['profilePhoto'],
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
