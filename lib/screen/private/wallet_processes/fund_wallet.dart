import 'package:camonta/screen/private/wallet_processes/fund_wallet_transfer.dart';
import 'package:flutter/material.dart';

class FundWallet extends StatefulWidget {
  @override
  _FundWalletState createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Fund Wallet',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        height: 500,
        child: Column(children: [
          Card(
            child: Container(
              margin: EdgeInsets.all(5),
              height: 100,
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FundWalletTransfer(),
                ),
              );
            },
            child: Card(
              child: Container(
                margin: EdgeInsets.all(5),
                height: 100,
                color: Colors.grey,
              ),
            ),
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(5),
              height: 100,
              color: Colors.grey,
            ),
          )
        ]),
      ),
    );
  }
}
