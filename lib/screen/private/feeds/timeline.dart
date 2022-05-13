import 'dart:async';
import 'dart:convert';

import 'package:camonta/screen/private/feeds/recommendation.dart';
import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/screen/private/layouts/layout_ordering_process/product_open.dart';
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
  Map userdata;
  HomeFeeds({Key? key, required this.userdata}) : super(key: key);

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

  List _recommendations = [
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
  bool _loadMore = false;
  late Timer _loadTimer;
  int _timerStart = 3;

  @override
  void initState() {
    // use session management class to set session
    // use session management class to set session
    _callSession();
    _callChef();
    _scrollController = ScrollController();

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
              print(_userData['profileCountry']);

              _getRecommendations1(_userData['profileCountry']);
            }),
          },
        );
  }

  _callChef() {
    httpService.getChefsAPIfunction().then((value) async => {
          setState(() {
            // print(value);
            if (value['status'] == 'ok') {
              _chefs = value['body'];
              // print('object');
            } else {
              // _myWallet = {'message': 'Something is wrong'};
            }
          })
        });
  }

  _getRecommendations1(profileCountry) {
    print('1st _getRecommendations is called');
    setState(() {
      isLoading = true;
    });
    httpService.getRecommendationsAPIfunction({
      "page": _page,
      "start": _newStart,
      "profileCountry": profileCountry,
    }).then((value) async => {
          setState(() {
            if (value['status'] == 'ok') {
              _myProducts = value['body'];
              _newStart = value['newstart'];
              _productCount = value['productCount'];
            } else {
              // _myWallet = {'message': 'Something is wrong'};
            }
          })
        });

    setState(() {
      isLoading = false;
      _page++;
    });
  }

  _getRecommendations2() {
    setState(() {
      isLoading = true;
    });
    httpService.getRecommendationsAPIfunction({
      "page": _page,
      "start": _newStart,
      "productCount": _productCount,
      "profileCountry": _userData['profileCountry'],
    }).then((value) async => {
          setState(() {
            _gridLengthMultiplier++;
            if (value['status'] == 'ok') {
              _myProducts.addAll(value['body']);
              _newStart = value['newstart'];
              // print('object');
            } else {
              // _myWallet = {'message': 'Something is wrong'};
            }
          })
        });
  }

  _onStartScroll(ScrollMetrics metrics) {
    // print("Scroll Start");
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    if (metrics.extentAfter == 0 &&
        (_myProducts.length < _productCount) &&
        isUpdateCall == false) {
      setState(() {
        isUpdateCall = true;
      });
      startTimer();
      _getRecommendations2();
    }
  }

  _onEndScroll(ScrollMetrics metrics) {
    // print("Scroll End");
  }

//  To create interval for when screen is scrolled to bottom before update is called again
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _loadTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerStart == 0) {
          setState(() {
            timer.cancel();
            isUpdateCall = false;
            _timerStart = 3;
          });
        } else {
          _timerStart--;
        }
        // print(_timerStart);
      },
    );
  }

  @override
  void dispose() {
    _loadTimer.cancel();
    super.dispose();
  }

  late ScrollController _scrollController;
  int _productCount = 0;
  List _myProducts = [];
  int _page = 1;
  bool isLoading = false;
  bool isUpdateCall = false;
  int _newStart = 1;
  int _gridLengthMultiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            _onStartScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollUpdateNotification) {
            _onUpdateScroll(scrollNotification.metrics);
          } else if (scrollNotification is ScrollEndNotification) {
            _onEndScroll(scrollNotification.metrics);
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xfff2f2f2),
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
                Container(
                  child: _myProducts.isNotEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: (MediaQuery.of(context).size.height + 80) *
                              _gridLengthMultiplier,
                          child: GridView.builder(
                            itemCount: _myProducts.length,
                            controller: _scrollController,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            itemBuilder: (context, index) {
                              return listItem2(_myProducts[index]);
                            },
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.width,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Container(
                              // color: Colors.white,
                              height: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.restaurant,
                                      size: 50,
                                    ),
                                  ),
                                  Container(
                                    child: Text('loading meals'),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FittedBox(
                                      child: CircularProgressIndicator(
                                        color: Color(0xff555555),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
                _myProducts.isNotEmpty && _myProducts.length < _productCount
                    ? SizedBox(
                        width: 50,
                        height: 50,
                        child: FittedBox(
                          child: CircularProgressIndicator(
                            color: Color(0xff555555),
                          ),
                        ),
                      )
                    : _myProducts.isNotEmpty &&
                            _myProducts.length == _productCount
                        ? Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffdddddd),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(' No more items from Nigerian Chefs '),
                          )
                        : Container(),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem2(_value) {
    String _walletCurrency = '';

    if (_value['productCountry'] == 'Nigeria') {
      // FOR nigeria Naira
      _walletCurrency = '₦';
    } else if (_value['productCountry'] == 'Ghana') {
      // FOR Ghana Cedi
      _walletCurrency = '¢';
    } else if (_value['productCountry'] == 'Kenya') {
      // FOR Kenya Shilling
      _walletCurrency = 'KSh';
    } else if (_value['productCountry'] == 'South Africa') {
      // FOR SouthAfrica Rand
      _walletCurrency = 'R';
    }
    // print(_value);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductOpen(productdetails: _value),
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
            image: _value['productPhotos'] == ''
                ? DecorationImage(
                    image: AssetImage("assets/product_default.png"),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(httpService.serverAPI +
                        json.decode(_value['productPhotos'])[0]),
                    fit: BoxFit.cover,
                  ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(0, 0, 0, 0.4),
            ),
            padding: EdgeInsets.all(6),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '@' + _value['profileUsername'],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          _value['productItem'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width - 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _walletCurrency +
                                  ' ' +
                                  _value['productPrice']
                                      .toString()
                                      .replaceAllMapped(
                                          RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => '${m[1]},'),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Color(0xffF29D38)),
                                  Text(
                                    _value['productRating'].toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
