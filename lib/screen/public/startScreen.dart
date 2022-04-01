import 'dart:async';

import 'package:camonta/screen/public/onboarding.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late Timer _timer;
  int _start = 3;

  @override
  void initState() {
    startTimer();
    print('hi there');
    // print(_userdata);
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Onboarding(),
            ),
          );
        } else {
          setState(() {
            _start--;
          });
        }
        print(_start);
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
      ),
      home: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Color(0xffC50303),
        ),
      ),
    );
  }
}
