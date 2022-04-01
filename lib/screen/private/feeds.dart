import 'package:camonta/screen/private/feed_tabview/feed_all.dart';
import 'package:camonta/screen/private/feed_tabview/feed_drinks.dart';
import 'package:camonta/screen/private/feed_tabview/feed_fruits.dart';
import 'package:camonta/screen/private/feed_tabview/feed_groceries.dart';
import 'package:camonta/screen/private/feed_tabview/feed_meals.dart';
import 'package:flutter/material.dart';

class HomeFeeds extends StatefulWidget {
  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Camonta',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          Container(
            width: 60,
            height: 120,
            margin: const EdgeInsets.only(top: 3, bottom: 3, right: 10),
            // color: Colors.purple,
            // child: Image.asset('assets/default.png'),

            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    'assets/default_dp.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 5.0,
                  child: Container(
                    child:
                        Icon(Icons.more_horiz, color: Colors.white, size: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              TextFormField(
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
              SizedBox(
                height: 20,
              ),

              // TAB IN HOME FEED SCREEN: START
              // TAB IN HOME FEED SCREEN: START
              DefaultTabController(
                initialIndex: 0,
                length: 5,
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
                            text: 'All',
                          ),
                          Tab(
                            text: 'Fruits',
                          ),
                          Tab(
                            text: 'Meals',
                          ),
                          Tab(
                            text: 'Drinks',
                          ),
                          Tab(
                            text: 'Groceries',
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
                          FeedGroceries(),
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
