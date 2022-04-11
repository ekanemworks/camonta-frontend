import 'package:flutter/material.dart';

class PromotionActivation extends StatefulWidget {
  @override
  _PromotionActivationState createState() => _PromotionActivationState();
}

class _PromotionActivationState extends State<PromotionActivation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Promotion Activation',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              // Wallet Card : START
              // Wallet Card : START
              Container(
                // height: 300,
                // color: Colors.grey,
                child: Column(
                  children: [
                    // top section
                    // top section
                    Container(
                      padding: EdgeInsets.all(18),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff343434), Color(0xff5C031D)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Janet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          // wallet balance section
                          Container(
                            alignment: Alignment.centerLeft,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Color(0xff730B0B)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Wallet Balance',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                const Text(
                                  '₦ 200,700',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          // wallet balance section
                          Container(
                            alignment: Alignment.centerLeft,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cash Balance',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      '₦ 200,700',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Bonus Balance',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 10),
                                    const Text(
                                      '₦ 700',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Wallet Card: END
              // Wallet Card: END

              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Activation Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Use my Camonta wallet to complete the transaction',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xffC50303),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: SizedBox(
                  width: 180, // <-- Your width
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'Pay & Activate',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => WithdrawDestination(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
                margin: EdgeInsets.only(top: 30, bottom: 30),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  color: Colors.grey,
                ),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 100,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
