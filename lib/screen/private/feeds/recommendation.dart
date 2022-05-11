import 'dart:convert';

import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/services/http_service.dart';
import 'package:flutter/material.dart';

class Recommendation extends StatefulWidget {
  Map getmyProductRequirementMap;
  Recommendation({Key? key, required this.getmyProductRequirementMap})
      : super(key: key);

  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  final HttpService httpService = HttpService();
  late ScrollController _scrollController;
  final int _maxLength = 12;
  List _myProducts = [];
  int _page = 1;
  bool isLoading = false;
  bool isLoadedMore = false;
  bool hasMore = true;
  int _newStart = 1;
  int _gridLengthMultiplier = 1;

  @override
  void initState() {
    // needed for when toggling between views: else it wouldn't load
    // needed for when toggling between views: else it wouldn't load
    _getRecommendations1();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.98 &&
          !isLoading) {
        print('in scrollController');
        print(_scrollController.position.maxScrollExtent);
        print('_scrollController.position.pixels');
        print(_scrollController.position.pixels);
        // if (_myProducts.length < _maxLength) {
        //   _getRecommendations2();
        // }
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Recommendation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.getmyProductRequirementMap['loadMore'] == true) {
      print('loadmore');
    }
  }

  _getRecommendations1() {
    print('1st _getRecommendations is called');
    setState(() {
      isLoading = true;
    });
    httpService.getRecommendationsAPIfunction({
      "page": _page,
      "start": _newStart
    }).then((value) async => {
          setState(() {
            if (value['status'] == 'ok') {
              _myProducts = value['body'];
              _newStart = value['newstart'];
              // print('object');
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
    print('2nd _getRecommendations is called');
    setState(() {
      isLoading = true;
    });
    httpService.getRecommendationsAPIfunction({
      "page": _page,
      "start": _newStart
    }).then((value) async => {
          setState(() {
            if (value['status'] == 'ok') {
              _myProducts.addAll(value['body']);
              _newStart = value['newstart'];
              // print('object');
            } else {
              // _myWallet = {'message': 'Something is wrong'};
            }
          })
        });

    setState(() {
      isLoading = false;
      isLoadedMore = true;
      _page = _page + 1;
      // if (_myProducts[0]['id'] == 7) {
      //   hasMore = false;
      // }
      hasMore = _myProducts.length < _maxLength;
    });

    print('has more ' + hasMore.toString());
    print('length ' + _myProducts.length.toString());
    print('maxlength ' + _maxLength.toString());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(_myProducts);

    return Container(
      child: _myProducts.isNotEmpty
          ? Container(
              width: MediaQuery.of(context).size.width - 10,
              color: Colors.red,
              height: (MediaQuery.of(context).size.height + 100) *
                  _gridLengthMultiplier,
              // padding: EdgeInsets.only(bottom: 200),
              // height: 1500,
              child: GridView.builder(
                itemCount: _myProducts.length,
                controller: _scrollController,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  if (index == _myProducts.length) {
                    // print('index is' + index.toString());
                    // print('length is' + _myProducts.length.toString());
                    return const SizedBox(
                      width: 50,
                      height: 50,
                      child: FittedBox(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return listItem2(_myProducts[index]);
                },
                // children: _myProducts.map((e) {
                //   return listItem2(e);
                // }).toList(),
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
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Icon(
                          Icons.restaurant,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Are Available Now!',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget listItem2(_value) {
    print('_value');
    print(_value);
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
              borderRadius: BorderRadius.circular(15), color: Colors.grey),
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
                      'dsds',
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

  // Widget listItem2(_value) {
  //   // print(_productPhoto);
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ProfileMeOpenItem(),
  //         ),
  //       );
  //     },
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           image: _value['productPhoto'] == ''
  //               ? DecorationImage(
  //                   image: AssetImage("assets/product_default.png"),
  //                   fit: BoxFit.cover,
  //                 )
  //               : DecorationImage(
  //                   image: NetworkImage(httpService.serverAPI +
  //                       json.decode(_value['productPhotos'])[
  //                           0]), // Picking the first image after converting the string to list
  //                   fit: BoxFit.cover,
  //                 ),
  //         ),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: const Color.fromRGBO(0, 0, 0, 0.2),
  //           ),
  //           padding: EdgeInsets.all(8),
  //           child: Align(
  //             alignment: Alignment.bottomLeft,
  //             child: ButtonBar(
  //               alignment: MainAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   // width: MediaQuery.of(context).size.width - 10,
  //                   // color: Colors.green,
  //                   child: Text(
  //                     _value['id'].toString(),
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget listItem2(_value) {
  //   var _productPhoto = _value['productPhotos'];
  //   // print(_productPhoto);
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ProfileMeOpenItem(),
  //         ),
  //       );
  //     },
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           image: _value['productPhoto'] == ''
  //               ? DecorationImage(
  //                   image: AssetImage("assets/product_default.png"),
  //                   fit: BoxFit.cover,
  //                 )
  //               : DecorationImage(
  //                   image: NetworkImage(httpService.serverAPI +
  //                       json.decode(_value['productPhotos'])[
  //                           0]), // Picking the first image after converting the string to list
  //                   fit: BoxFit.cover,
  //                 ),
  //         ),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: const Color.fromRGBO(0, 0, 0, 0.2),
  //           ),
  //           padding: EdgeInsets.all(8),
  //           child: Align(
  //             alignment: Alignment.bottomLeft,
  //             child: ButtonBar(
  //               alignment: MainAxisAlignment.center,
  //               children: [
  //                 Container(
  //                   // width: MediaQuery.of(context).size.width - 10,
  //                   // color: Colors.green,
  //                   child: Text(
  //                     '_value',
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
