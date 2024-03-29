import 'dart:convert';

import 'package:camonta/screen/private/cart/cart.dart';
import 'package:camonta/screen/private/explore/explore.dart';
import 'package:camonta/screen/private/feeds/timeline.dart';
import 'package:camonta/screen/private/appbar_action_layout/appbar_me.dart';
import 'package:camonta/screen/private/notification/notification.dart';
import 'package:camonta/screen/private/wallet/wallet.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  int initialNavIndex;
  Home({Key? key, required this.initialNavIndex}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();
  String _matayas = '';
  Map _userData = {};
  Map _myWallet = {};
  List screens = [];
  int navigationIndex = 0;
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
    _callSession();
    if (widget.initialNavIndex != 0) {
      navigationIndex = widget.initialNavIndex;
    }
    super.initState();
  }

  _callSession() {
    // use session management class to set session
    // use session management class to set session
    sessionMgt.getSession().then(
          (value) => {
            setState(() {
              // decode
              _userData = json.decode(value);
              _callWallet(_userData);
              // print(_userData);
            }),
          },
        );
  }

  _callWallet(userData) {
    httpService.getMyWalletAPIfunction(userData).then((value) async => {
          setState(() {
            // print(value);
            if (value['status'] == 'ok') {
              _myWallet = value['body'];
              // print('object');
            } else {
              _myWallet = {'message': 'Something is wrong'};
            }
          })
        });
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          // foregroundColor: Colors.black,
          // backgroundColor: Color(0xff008a81), // 1
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xff9F033E), Color(0xff71012C)],
              ),
            ),
          ),
          elevation: 0,
          title: Text(
            navigationIndex == 0
                ? 'Camonta'
                : navigationIndex == 1
                    ? 'Explore'
                    : navigationIndex == 2
                        ? 'Cart'
                        : navigationIndex == 3
                            ? 'Notification'
                            : 'Wallet',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          actions: [
            AppbarMe(),
          ],
        ),
        body: IndexedStack(
          index: navigationIndex,
          children: <Widget>[
            HomeFeeds(userdata: _userData),
            Explore(userdata: _userData),
            Cart(userdata: _userData),
            AppNotification(userdata: _userData),
            Wallet(userdata: _userData, walletdata: _myWallet),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: navigationKey,
          color: Color(0xff222127),
          buttonBackgroundColor: Color(0xff71012C),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          items: [
            Icon(
              Icons.home_filled,
              size: 30,
              color: navigationIndex == 0 ? Colors.white : Color(0xffC3C3C3),
            ),
            Icon(
              Icons.explore,
              size: 30,
              color: navigationIndex == 1 ? Colors.white : Color(0xffC3C3C3),
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: navigationIndex == 2 ? Colors.white : Color(0xffC3C3C3),
            ),
            Icon(
              Icons.favorite,
              size: 30,
              color: navigationIndex == 3 ? Colors.white : Colors.grey,
            ),
            Icon(
              Icons.account_balance_wallet,
              size: 30,
              color: navigationIndex == 4 ? Colors.white : Colors.grey,
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
