import 'dart:convert';

import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/screen/private/profile/create_ad/promotion_type.dart';
import 'package:camonta/screen/private/profile/profile_edit.dart';
import 'package:camonta/screen/private/profile/profile_item_view_layout/profile_customer_bookmark_view.dart';
import 'package:camonta/screen/private/profile/profile_item_view_layout/profile_customer_orders_view.dart';
import 'package:camonta/screen/private/profile/profile_promotions.dart';
import 'package:camonta/screen/private/profile/profile_settings.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class ProfileCustomer extends StatefulWidget {
  @override
  _ProfileCustomerState createState() => _ProfileCustomerState();
}

class _ProfileCustomerState extends State<ProfileCustomer> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  var _editedProfile;
  bool _display_myOrders = true;
  List _myOrders = [];
  List _myBookmarks = [];
  Map _userData = {
    'id': 0,
    'profileType': '',
    'session': '',
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
              print(_userData);
            }),
          },
        );
  }

  List _baybn_members_general = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.black,
        backgroundColor: Color(0xff840233), // 1
        elevation: 0,
        title: Text(
          _userData['profileUsername'],
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSettings(),
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // PROFILE DP CONTAINER
                        Container(
                          width: 120,
                          height: 120,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          // color: Colors.purple,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: _userData['profilePhoto'] == ''
                                ? Image.asset(
                                    'assets/default_dp.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    httpService.serverAPI +
                                        _userData['profilePhoto'],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        // END: PROFILE DP CONTAINER
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width - 190,

                                width: MediaQuery.of(context).size.width - 200,
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          _userData['myProductCount']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Padding(padding: const EdgeInsets.all(2), chid:)
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            'Points',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          _userData['profileServes'].toString(),
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // Padding(padding: const EdgeInsets.all(2), chid:)
                                        Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            'Friends',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 200,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 44,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          // color: Color(0xff9A033C),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Color(0xffC9024D),
                                              Color(0xffAA0040)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          border: Border.all(
                                            color: Color(0xffB90247),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: double
                                              .maxFinite, // <-- Your width
                                          height: 50,
                                          child: ElevatedButton(
                                            child: const Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onPressed: () async {
                                              _editedProfile =
                                                  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileEdit(
                                                          data: _userData),
                                                ),
                                              );

                                              if (_editedProfile == null) {
                                                callSession();
                                              } else {
                                                callSession();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // PROFILE NAME
                    // PROFILE NAME
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        _userData['profileName'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    // BIO
                    // BIO
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 20, top: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Text(_userData['profileBio']),
                    ),
                  ],
                ),
              ),

              // NAVIGATION CARD
              // NAVIGATION CARD
              // NAVIGATION CARD
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  // width: MediaQuery.of(context).size.width - 190,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _display_myOrders = true;
                            });
                          },
                          child: _display_myOrders == true
                              ? Icon(
                                  Icons.shopping_bag,
                                  color: Color(0xffB80146),
                                )
                              : Icon(
                                  Icons.shopping_bag,
                                  color: Color(0xff999999),
                                ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _display_myOrders = false;
                            });
                          },
                          child: _display_myOrders == true
                              ? Icon(
                                  Icons.bookmark,
                                  color: Color(0xff999999),
                                  size: 28,
                                )
                              : Icon(
                                  Icons.bookmark,
                                  color: Colors.orange,
                                  size: 28,
                                ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePromotions(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Friends',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 18, color: Colors.grey),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // END OF PROFILE NAV CARD

              _display_myOrders == true
                  ? ProfileCustomerItemOrders(myOrders: _myOrders)
                  : ProfileCustomerItemBookmark(myBookmarks: _myBookmarks)
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xffC50303),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xffC50303),
              ),
            ),
            child: SizedBox(
              width: double.maxFinite, // <-- Your width
              height: 50,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create Ad',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.record_voice_over_outlined)
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PromotionType(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem2(_value) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(0, 0, 0, 0.2),
            ),
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width - 10,
                    // color: Colors.green,
                    child: Text(
                      _value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
