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
          color: Colors.red,
          child: Column(
            children: [
              // Chefs
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
                color: Colors.green,
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

              // popular
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 20, bottom: 5),
                child: Text(
                  'Popular',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height - 120,
                // height: 1000,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollStartNotification) {
                      // _onStartScroll(scrollNotification.metrics);
                    } else if (scrollNotification is ScrollUpdateNotification) {
                      _onUpdateScroll(scrollNotification.metrics);
                      // print('scrolling');
                    } else if (scrollNotification is ScrollEndNotification) {
                      // _onEndScroll(scrollNotification.metrics);
                    }
                    return true;
                  },
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                    children: List.generate(
                      20,
                      (index) => Container(
                        color: Colors.white,
                        child: Icon(
                          Icons.touch_app,
                          size: 30,
                          color: Colors.yellow[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
