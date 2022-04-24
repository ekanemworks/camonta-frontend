import 'package:camonta/screen/private/layout_wallet_processes/fund_wallet.dart';
import 'package:camonta/screen/private/layout_wallet_processes/withdraw_amount.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              // Wallet Card : START
              // Wallet Card : START
              Container(
                height: 300,
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
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
                    // bottom section
                    // bottom section
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff000000), Color(0xff490318)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              // width: 150,
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
                                  child: const Text(
                                    'Fund Wallet',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FundWallet(),
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
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23.0),
                              ),
                              child: SizedBox(
                                width: double.maxFinite, // <-- Your width
                                height: 50,
                                child: ElevatedButton(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'Withdraw',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.arrow_right_alt,
                                          color: Colors.black)
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WithdrawAmount(),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Wallet Card: END
              // Wallet Card: END
            ],
          ),
        ),
      ),
    );
  }
}
