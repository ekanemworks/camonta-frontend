import 'dart:convert';

import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/screen/private/profile/add_product/newproduct_info.dart';
import 'package:camonta/screen/private/profile/create_ad/promotion_type.dart';
import 'package:camonta/screen/private/profile/profile_edit.dart';
import 'package:camonta/screen/private/profile/profile_promotions.dart';
import 'package:camonta/screen/private/profile/profile_settings.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class ProfileChef extends StatefulWidget {
  @override
  _ProfileChefState createState() => _ProfileChefState();
}

class _ProfileChefState extends State<ProfileChef> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  var _editedProfile;
  List _myProducts = [];

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
              // print(_userData);
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
          _userData['profileName'],
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    // color: Colors.purple,
                    // child: Image.asset('assets/default.png'),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset(
                        'assets/default_dp.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width - 190,

                        width: MediaQuery.of(context).size.width - 200,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  _userData['myProductCount'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Padding(padding: const EdgeInsets.all(2), chid:)
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Products',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _userData['profileServes'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Padding(padding: const EdgeInsets.all(2), chid:)
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Serves',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _userData['profileServes'].toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Padding(padding: const EdgeInsets.all(2), chid:)
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Likes',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
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
                                  color: Color(0xff840233),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xff840233),
                                  ),
                                ),
                                child: SizedBox(
                                  width: double.maxFinite, // <-- Your width
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
                                      _editedProfile = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileEdit(data: _userData),
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
                            IconButton(
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // ABOUT
              // ABOUT
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20, top: 10),
                margin: EdgeInsets.only(left: 10),
                child: Text(_userData['profileBio']),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          // Padding(padding: const EdgeInsets.all(2), chid:)
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'My Products',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
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
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Promotions',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Friends',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              _myProducts.isNotEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width - 10,
                      height: MediaQuery.of(context).size.height,
                      // height: 1000,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2 / 3),
                        children: _baybn_members_general.map((e) {
                          return listItem2(e);
                        }).toList(),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                          height: 100,
                          child: Column(
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                size: 50,
                              ),
                              SizedBox(height: 20),
                              Text('You have no meal to display')
                            ],
                          ),
                        ),
                      ),
                    )
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
              color: Color(0xffF3EFEF),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xffEBEAEA),
              ),
            ),
            child: SizedBox(
              width: double.maxFinite, // <-- Your width
              height: 50,
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Meal',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff840233),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.add_shopping_cart,
                      color: Color(0xff840233),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewProductInfo(),
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
          SizedBox(height: 10),
          Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xff840233),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xff840233),
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
                    SizedBox(width: 5),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileMeOpenItem(),
          ),
        );
      },
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
