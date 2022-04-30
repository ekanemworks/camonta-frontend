import 'package:camonta/screen/private/wallet/wallet_processes/withdraw_destination.dart';
import 'package:flutter/material.dart';

class WithdrawAmount extends StatefulWidget {
  @override
  _WithdrawAmountState createState() => _WithdrawAmountState();
}

class _WithdrawAmountState extends State<WithdrawAmount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Withdraw',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                'Withdraw',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                // initialValue: _edit_fullname,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),

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
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color(0xffC50303),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: SizedBox(
                width: 120, // <-- Your width
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WithdrawDestination(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
