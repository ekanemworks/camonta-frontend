import 'package:camonta/screen/private/layout_promotion_process/promotion_product_selection.dart';
import 'package:flutter/material.dart';

class PromotionType extends StatefulWidget {
  @override
  _PromotionTypeState createState() => _PromotionTypeState();
}

class _PromotionTypeState extends State<PromotionType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Create Promotion',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        // height: 500,
        child: Center(
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            // color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'What to promote?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PromotionProductSelection(),
                      ),
                    );
                  },
                  child: Card(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'My Product on Camonta',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'A new post / content',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
