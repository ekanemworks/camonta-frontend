import 'package:camonta/screen/private/logistics/logistics_order_details.dart';
import 'package:flutter/material.dart';

class LogisticDashboard extends StatefulWidget {
  @override
  _LogisticDashboardState createState() => _LogisticDashboardState();
}

class _LogisticDashboardState extends State<LogisticDashboard> {
  List _chartItems = ['', ''];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white, // 1
          elevation: 0,
          title: Text(
            'Camonta',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // color: Colors.purple,
                      // child: Image.asset('assets/default.png'),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          'assets/default_dp.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width - 190,

                          width: MediaQuery.of(context).size.width - 200,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Padding(padding: const EdgeInsets.all(2), chid:)
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      'Meals',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '10',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Padding(padding: const EdgeInsets.all(2), chid:)
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      'Serves',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '21',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Padding(padding: const EdgeInsets.all(2), chid:)
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      'Likes',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC50303),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(0xffC50303),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite, // <-- Your width
                                    height: 50,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Edit Info',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => ProfileEdit(),
                                        //   ),
                                        // );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // ABOUT
                // ABOUT
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 20, top: 10),
                  margin: EdgeInsets.only(left: 10),
                  child: Text('Hey there, This is my Camonta bio'),
                ),
                // NAVIGATION CARD
                // NAVIGATION CARD
                // NAVIGATION CARD
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 190,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            // Padding(padding: const EdgeInsets.all(2), chid:)
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'My Orders',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ProfilePromotions(),
                            //   ),
                            // );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Text(
                                  'Processing',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Completed',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // list
                Container(
                  child: Column(
                    children: _chartItems.map((e) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogisticsOrderDetails(),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      // padding: EdgeInsets.all(10),
                                      color: Colors.blue,
                                      height: 100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
