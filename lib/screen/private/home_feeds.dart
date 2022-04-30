import 'package:camonta/screen/private/feed_tab_view/feed_all.dart';
import 'package:camonta/screen/private/feed_tab_view/feed_drinks.dart';
import 'package:camonta/screen/private/feed_tab_view/feed_fruits.dart';
import 'package:camonta/screen/private/feed_tab_view/feed_groceries.dart';
import 'package:camonta/screen/private/feed_tab_view/feed_meals.dart';
import 'package:camonta/screen/private/layout_appbar_me/appbar_me.dart';
import 'package:flutter/material.dart';

class HomeFeeds extends StatefulWidget {
  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  List _chefs = [
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
      body: SingleChildScrollView(
        child: Container(
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

              // TextFormField(
              //   decoration: const InputDecoration(
              //     // labelText: 'Email Address',
              //     prefixIcon: Icon(Icons.search),
              //     suffixIcon: Icon(Icons.sort_rounded),
              //     hintText: "Search Meal",
              //     fillColor: Colors.white,
              //     filled: true,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(16.0),
              //       ),
              //     ),
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Enter a valid Email';
              //     }

              //     if (!RegExp(
              //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //         .hasMatch(value)) {
              //       return 'Please enter a valid phone number';
              //     }
              //   },
              //   onSaved: (value) {
              //     // _emailAddress = value!;
              //   },
              // ),
              SizedBox(
                height: 20,
              ),

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
                            text: 'For You',
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
                          FeedAll(),
                          FeedFruits(),
                          FeedMeals(),
                          FeedDrinks(),
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
}
