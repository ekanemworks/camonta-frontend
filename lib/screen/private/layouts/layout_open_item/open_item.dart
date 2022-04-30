import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OpenItem extends StatefulWidget {
  @override
  _OpenItemState createState() => _OpenItemState();
}

class _OpenItemState extends State<OpenItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            color: Colors.grey.shade200,
            margin: EdgeInsets.only(top: 20),
            height: 260,
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
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 5),
              ),
            ),
          ),
        ),
        // Name of Food/ Item
        // Name of Food/ Item
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Broccoli',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Description
        // Description
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Cool nice brocc, a very tasty mean and sumptious while eating. Great taste and refreshing',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
