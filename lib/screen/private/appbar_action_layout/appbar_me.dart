import 'package:camonta/screen/private/notification/notification.dart';
import 'package:camonta/screen/private/profile/profile.dart';
import 'package:flutter/material.dart';

class AppbarMe extends StatefulWidget {
  @override
  _AppbarMeState createState() => _AppbarMeState();
}

class _AppbarMeState extends State<AppbarMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            border: Border.all(width: 1, color: Color(0xff5A0223)),
            // color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xff9F033E), Color(0xff7F0131)],
            ),
          ),
          padding: EdgeInsets.only(left: 5, right: 5),
          margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                ),
                // color: Colors.purple,
                // child: Image.asset('assets/default.png'),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    'assets/default_dp.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
