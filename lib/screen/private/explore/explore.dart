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
          child: Column(
            children: [
              // Chefs

              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    // labelText: 'Email Address',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.sort_rounded),
                    hintText: "Search Meal",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid Email';
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                  },
                  onSaved: (value) {
                    // _emailAddress = value!;
                  },
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
                      child: TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
