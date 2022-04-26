import 'package:flutter/material.dart';

class FundWalletTransfer extends StatefulWidget {
  @override
  _FundWalletTransferState createState() => _FundWalletTransferState();
}

class _FundWalletTransferState extends State<FundWalletTransfer> {
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Bank Tranfer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  'Camonta Partnering Accounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // THE DOUBLE HORIZONTAL LINE
              // THE DOUBLE HORIZONTAL LINE
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 2),
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bank:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // width: 150,
                    child: Text(
                      'United Bank for Africa (UBA)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Number:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // width: 150,
                    child: Text(
                      '2095013103',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Name:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // width: 150,
                    child: Text(
                      'Camonta Limited',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction fee:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    // width: 150,
                    child: Text(
                      '₦ 0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              // THE DOUBLE HORIZONTAL LINE
              // THE DOUBLE HORIZONTAL LINE
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: 2),
              Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                    'Contact support after transaction with proof of payment and transaction reference'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
