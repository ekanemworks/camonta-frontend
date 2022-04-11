import 'package:camonta/screen/private/layout_add_product/newproduct_info.dart';
import 'package:camonta/screen/private/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/screen/private/layout_promotion_process/promotion_type.dart';
import 'package:camonta/screen/private/profile_edit.dart';
import 'package:camonta/screen/private/profile_promotions.dart';
import 'package:camonta/screen/private/profile_settings.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Name',
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
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfileEdit(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileSettings(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.settings,
                              ),
                            )
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
                              'My products',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePromotions(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Promotions',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
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
                              'Orders',
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

              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height,
                // height: 1000,
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3),
                  children: _baybn_members_general.map((e) {
                    return listItem2(e);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                  // width: 2,
                  // color: Color(0xffC50303),
                  color: Colors.transparent),
            ),
            child: SizedBox(
              width: double.maxFinite, // <-- Your width
              height: 50,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add Meal',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffC50303),
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.add, color: Color(0xffC50303))
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewProductInfo(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xffC50303),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xffC50303),
              ),
            ),
            child: SizedBox(
              width: double.maxFinite, // <-- Your width
              height: 50,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Promote',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.record_voice_over_outlined)
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PromotionType(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem2(_value) {
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
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
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
