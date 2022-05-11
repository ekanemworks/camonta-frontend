import 'dart:convert';

import 'package:camonta/screen/private/wallet/wallet_processes/fund_wallet.dart';
import 'package:camonta/screen/private/wallet/wallet_processes/withdraw_amount.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  Map userdata;
  Map walletdata;
  Wallet({Key? key, required this.userdata, required this.walletdata})
      : super(key: key);
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int _walletCash = 0;
  int _walletBonus = 0;
  String _walletCurrency = '';
  List _walletTransactionHistory = [];
  String _walletPassword = '';
  int _walletBalance = 0;

  @override
  void initState() {
    // needed for when toggling between views: else it wouldn't load
    // needed for when toggling between views: else it wouldn't load
    // setState(() {
    //   _callProducts(widget.getmyProductRequirementMap);
    // });
    // print(widget.walletdata);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Wallet oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.walletdata['id'] != null) {
      _walletCash = widget.walletdata['walletCash'];
      _walletBonus = widget.walletdata['walletBonus'];
      _walletCurrency = widget.walletdata['walletCurrency'];
      _walletTransactionHistory =
          json.decode(widget.walletdata['walletTransactionHistory']);
      _walletPassword = widget.walletdata['walletPassword'];
      _walletBalance = _walletCash + _walletBonus;

      if (_walletCurrency == 'NGN') {
        // FOR nigeria Naira
        _walletCurrency = '₦';
      } else if (_walletCurrency == 'GH₵') {
        // FOR Ghana Cedi
        _walletCurrency = '¢';
      } else if (_walletCurrency == 'KSh') {
        // FOR Kenya Shilling
        _walletCurrency = 'KSh';
      } else if (_walletCurrency == 'ZAR') {
        // FOR SouthAfrica Rand
        _walletCurrency = 'R';
      }
    }

    // setState(() {
    //   _callProducts(widget.getmyProductRequirementMap);
    // });
  }

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
                                Text(
                                  _walletCurrency +
                                      ' ' +
                                      _walletBalance.toString().replaceAllMapped(
                                          RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => '${m[1]},'),
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
                                    Text(
                                      _walletCurrency +
                                          ' ' +
                                          _walletCash.toString().replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},'),
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
                                    Text(
                                      _walletCurrency +
                                          ' ' +
                                          _walletBonus.toString().replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},'),
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
