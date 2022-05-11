import 'package:flutter/material.dart';

class AppNotification extends StatefulWidget {
  Map userdata;
  AppNotification({Key? key, required this.userdata}) : super(key: key);
  @override
  _AppNotificationState createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification> {
  @override
  Widget build(BuildContext context) {
    List _chartItems = ['', ''];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Container(
          child: Column(
            children: _chartItems.map((e) {
              return Container(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            // padding: EdgeInsets.all(10),
                            color: Colors.blue,
                            height: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
