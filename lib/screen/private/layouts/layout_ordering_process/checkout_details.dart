import 'package:camonta/screen/private/layouts/layout_ordering_process/checkout_payment.dart';
import 'package:flutter/material.dart';

class CheckoutDetails extends StatefulWidget {
  @override
  _CheckoutDetailsState createState() => _CheckoutDetailsState();
}

class _CheckoutDetailsState extends State<CheckoutDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
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
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Container(
          // color: Colors.deepPurple,
          // width: 100,
          // margin: const EdgeInsets.only(left: 40, right: 40),
          height: 400,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    // initialValue: _edit_fullname,
                    decoration:
                        const InputDecoration(labelText: 'Delivery Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Profile name cannot be empty';
                      }
                    },
                    onSaved: (value) {
                      // _edit_fullname = value!;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    // initialValue: _edit_username,
                    decoration: const InputDecoration(
                        labelText: 'Name of expected reciever'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username cannot be empty';
                      }
                    },
                    onSaved: (value) {
                      // _edit_username = value!;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Next',
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
                            builder: (context) => CheckoutPayment(),
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

                // Text(mapdata.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
