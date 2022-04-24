import 'package:camonta/screen/private/layout_ordering_process/product_description.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeedAll extends StatefulWidget {
  @override
  _FeedAllState createState() => _FeedAllState();
}

class _FeedAllState extends State<FeedAll> {
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.only(),
              height: 230,
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.0),
                      // in container if you want to show a background image you need box decoration
                      image: const DecorationImage(
                        image: AssetImage('assets/onboarding/chefs.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Text('$index'),
                  );
                },
                options: CarouselOptions(
                  height: 170,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  // enableInfiniteScroll: false,
                  autoPlayInterval: Duration(seconds: 10),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.only(top: 20),
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
    );
  }

  Widget listItem2(_value) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDescription(),
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
