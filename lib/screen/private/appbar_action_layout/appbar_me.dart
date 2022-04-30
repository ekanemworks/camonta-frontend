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
      child: Row(children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppNotification(),
              ),
            );
          },
          icon: Icon(Icons.favorite),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 120,
            margin: const EdgeInsets.only(top: 3, bottom: 3, right: 20),
            // color: Colors.purple,
            // child: Image.asset('assets/default.png'),

            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image.asset(
                    'assets/default_dp.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 5.0,
                  child: Container(
                    child: Icon(Icons.grid_3x3, color: Colors.white, size: 18),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
