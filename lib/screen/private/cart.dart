import 'package:camonta/screen/private/layout_ordering_process/checkout_details.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List _chartItems = [
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'Source:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 10, right: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          'assets/default_dp.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text('@mariam_stores'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Sub-total:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text('₦ 1,100'),
                      ],
                    ),
                  ),
                  Container(
                    height: 44,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Check Out',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_right_alt)
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutDetails(),
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
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: _chartItems.map((e) {
                    return Container(
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
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
