import 'dart:convert';

import 'package:camonta/screen/private/feeds/recommendation.dart';
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

class HomeFeeds extends StatefulWidget {
  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  List _chefs = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
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
              // print(_userData);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff2f2f2),
          margin: EdgeInsets.only(bottom: 500),

          // height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Chef',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 180,
                // color: Colors.green,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _chefs.map((e) {
                    return Container(
                      // height: 100,
                      width: 100,
                      // color: Colors.grey,
                      margin: EdgeInsets.only(left: 7, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'For You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Recommendation(
                  getmyProductRequirementMap: _getmyProductRequirementMap)
            ],
          ),
        ),
      ),
    );
  }
}
