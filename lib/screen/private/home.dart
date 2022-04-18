import 'dart:convert';

import 'package:camonta/screen/private/cart.dart';
import 'package:camonta/screen/private/explore.dart';
import 'package:camonta/screen/private/home_feeds.dart';
import 'package:camonta/screen/private/layout_appbar_me/appbar_me.dart';
import 'package:camonta/screen/private/wallet.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  String _matayas = '';
  Map _userData = {};
  // Map _userData = {
  //   'id': 0,
  //   'profileType': '',
  //   'session': '',
  //   'profileName': '',
  //   'profileUsername': '',
  //   'profilePhoto': '',
  //   'profileBio': '',
  //   'profileEmail': '',
  //   'profileEmailStatus': '',
  //   'password': '',
  //   'registrationDate': '',
  //   'notification': '',
  //   'myPurchase': '',
  //   'profileLikeIdArray': '',
  //   'profileServes': '',
  //   'profilePoints': '',
  // };

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

  final naviagtionItems = <Widget>[
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.explore,
      size: 30,
    ),
    Icon(
      Icons.shopping_cart,
      size: 30,
    ),
    Icon(
      Icons.account_balance_wallet,
      size: 30,
    ),
  ];

  List screens = [
    HomeFeeds(),
    Explore(),
    Cart(),
    Wallet(),
  ];

  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white, // 1
          elevation: 0,
          title: Text(
            navigationIndex == 0
                ? 'Camonta'
                : navigationIndex == 1
                    ? 'Explore'
                    : navigationIndex == 2
                        ? 'Cart'
                        : 'Wallet',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          actions: [
            AppbarMe(),
          ],
        ),
        body: screens[navigationIndex],
        // Center(
        //   child: Text('$navigationIndex'),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,

          // color: navigationIndex == 0 ? Colors.red : Colors.black,
          buttonBackgroundColor: Color(0xffC50303),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          items: [
            Icon(
              Icons.home_filled,
              size: 30,
              color: navigationIndex == 0 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.explore,
              size: 30,
              color: navigationIndex == 1 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: navigationIndex == 2 ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.account_balance_wallet,
              size: 30,
              color: navigationIndex == 3 ? Colors.white : Colors.black,
            ),
          ],
          index: navigationIndex,
          onTap: (index) {
            setState(() {
              this.navigationIndex = index;
            });
          },
        ),
      ),
    );
  }
}
