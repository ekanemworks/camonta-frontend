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
    );
  }
}
