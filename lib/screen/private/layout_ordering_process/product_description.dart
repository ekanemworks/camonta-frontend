import 'package:camonta/screen/private/layout_open_item/open_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,

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
            children: [OpenItem()],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xffC50303),
          borderRadius: BorderRadius.circular(23.0),
          border: Border.all(
            color: Color(0xffC50303),
          ),
        ),
        child: SizedBox(
          width: double.maxFinite, // <-- Your width
          height: 50,
          child: ElevatedButton(
            child: Row(
              children: [
                const Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(Icons.shopping_cart)
              ],
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
