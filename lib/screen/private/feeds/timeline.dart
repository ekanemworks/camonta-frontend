import 'package:camonta/screen/private/feeds/recommendation.dart';
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
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'For You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Recommendation(),
            ],
          ),
        ),
      ),
    );
  }
}
