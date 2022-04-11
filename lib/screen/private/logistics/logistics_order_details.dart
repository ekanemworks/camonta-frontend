import 'package:flutter/material.dart';

class LogisticsOrderDetails extends StatefulWidget {
  @override
  _LogisticsOrderDetailsState createState() => _LogisticsOrderDetailsState();
}

class _LogisticsOrderDetailsState extends State<LogisticsOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'From: (Seller)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                          Container(
                            child: Text(
                              'Items',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                          Container(
                            child: Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //  CUSTOMER SECTION: START
              //  CUSTOMER SECTION: START
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'From: (Seller)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                          Container(
                            child: Text(
                              'Items',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                          Container(
                            child: Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text('@janet_kitchen'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
