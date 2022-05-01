import 'package:camonta/screen/private/explore/explore_tabs/explore_tab_drinks.dart';
import 'package:camonta/screen/private/explore/explore_tabs/explore_tab_farm.dart';
import 'package:camonta/screen/private/explore/explore_tabs/explore_tab_meal.dart';
import 'package:camonta/screen/private/explore/explore_tabs/explore_tab_popular.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List _chefs = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

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

  _onUpdateScroll(ScrollMetrics metrics) {
    // print(metrics.extentAfter > 245);
    // print();
    if (metrics.extentAfter > 245) {
      print('top');
    } else {
      print('body');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfffafafa),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.sort_rounded),
                    hintText: "Search Meal",
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE3E2E2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              // popular
              // Container(
              //   alignment: Alignment.centerLeft,
              //   margin: EdgeInsets.only(left: 10, top: 20, bottom: 5),
              //   child: Text(
              //     'Popular',
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // TAB IN HOME FEED SCREEN: START
              // TAB IN HOME FEED SCREEN: START
              DefaultTabController(
                initialIndex: 0,
                length: 4,
                child: Column(
                  children: [
                    Container(
                      // width: double.maxFinite,
                      padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          border:
                              Border.all(width: 1, color: Color(0xffB6B6B6)),
                          // color: Colors.white,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xffF0EFEF),
                              Color(0xffDCDBDB)
                            ],
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        tabs: [
                          Tab(
                            text: 'Popular',
                          ),
                          Tab(
                            text: 'Meals',
                          ),
                          Tab(
                            text: 'Drinks',
                          ),
                          Tab(
                            text: 'Farm',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 700,
                      // color: Colors.blue,
                      child: TabBarView(
                        children: [
                          ExploreTabPopular(),
                          ExploreTabMeal(),
                          ExploreTabDrinks(),
                          ExploreTabFarm(),
                          // FeedGroceries(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // END: TAB IN HOME FEED SCREEN:
              // END: TAB IN HOME FEED SCREEN:
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem2(_value) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
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
