import 'dart:convert';

import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/screen/private/profile/add_product/newproduct_info.dart';
import 'package:camonta/screen/private/profile/create_ad/promotion_type.dart';
import 'package:camonta/screen/private/profile/profile_edit.dart';
import 'package:camonta/screen/private/profile/profile_item_view_layout/profile_chef_grid_view.dart';
import 'package:camonta/screen/private/profile/profile_item_view_layout/profile_chef_list_view.dart';
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
  var _editedProfile; // to recoil from Editprofile page to reload session for profile page
  bool _itemGridView = true;
  Map _getmyProductRequirementMap = {};
  int _productOwnerid = 0;
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

              _getmyProductRequirementMap = {
                'productOwnerid': _userData['id'],
                'profileSession': _userData['profileSession']
              };
              // _productOwnerid = _userData['id'];

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
          '@' + _userData['profileUsername'],
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
          color: Color(0xfff2f2f2),
          margin: EdgeInsets.only(bottom: 500),

          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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
                                            'Meals',
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
                                            'Serves',
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
                                            'Likes',
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
                              _itemGridView = true;
                            });
                          },
                          child: _itemGridView == true
                              ? Icon(
                                  Icons.grid_view_rounded,
                                  color: Color(0xffB80146),
                                )
                              : Icon(
                                  Icons.grid_view_rounded,
                                  color: Color(0xff999999),
                                ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _itemGridView = false;
                            });
                          },
                          child: _itemGridView == false
                              ? Icon(
                                  Icons.view_list_rounded,
                                  color: Color(0xffB80146),
                                  size: 28,
                                )
                              : Icon(
                                  Icons.view_list_rounded,
                                  color: Color(0xff999999),
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
                                      'Campaigns',
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

              // _getmyProductRequirementMap == {}
              //     ? Container()
              //     :
              _itemGridView == false
                  ? ProfileChefItemListView(
                      getmyProductRequirementMap: _getmyProductRequirementMap)
                  : ProfileChefItemGridView(
                      getmyProductRequirementMap: _getmyProductRequirementMap)
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xffe1e1e1),
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
                          color: Color(0xffB90247),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.add,
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
              color: Color(0xffB90247),
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
}
