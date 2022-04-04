import 'package:flutter/material.dart';

class WithdrawDestination extends StatefulWidget {
  @override
  _WithdrawDestinationState createState() => _WithdrawDestinationState();
}

class _WithdrawDestinationState extends State<WithdrawDestination> {
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
