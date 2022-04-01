import 'package:camonta/screen/private/cart.dart';
import 'package:camonta/screen/private/explore.dart';
import 'package:camonta/screen/private/feeds.dart';
import 'package:camonta/screen/private/wallet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  List screens = [HomeFeeds(), Explore(), Cart(), Wallet()];

  int navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,

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
              color: navigationIndex == 0 ? Colors.white : Colors.black54,
            ),
            Icon(
              Icons.explore,
              size: 30,
              color: navigationIndex == 1 ? Colors.white : Colors.black54,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: navigationIndex == 2 ? Colors.white : Colors.black54,
            ),
            Icon(
              Icons.account_balance_wallet,
              size: 30,
              color: navigationIndex == 3 ? Colors.white : Colors.black54,
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
