import 'package:flutter/material.dart';

class FundWalletConfirmation extends StatefulWidget {
  @override
  _FundWalletConfirmationState createState() => _FundWalletConfirmationState();
}

class _FundWalletConfirmationState extends State<FundWalletConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Fund',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Success',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  child:
                      Text('Your Camonta Wallet has being successfully funded'))
            ],
          ),
        ),
      ),
    );
  }
}
