import 'package:flutter/material.dart';

class ExploreTabDrinks extends StatefulWidget {
  @override
  _ExploreTabDrinksState createState() => _ExploreTabDrinksState();
}

class _ExploreTabDrinksState extends State<ExploreTabDrinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height - 120,
      // height: 1000,
      child: NotificationListener<ScrollNotification>(
        // onNotification: (scrollNotification) {
        //   if (scrollNotification is ScrollStartNotification) {
        //     // _onStartScroll(scrollNotification.metrics);
        //   } else if (scrollNotification is ScrollUpdateNotification) {
        //     _onUpdateScroll(scrollNotification.metrics);
        //     // print('scrolling');
        //   } else if (scrollNotification is ScrollEndNotification) {
        //     // _onEndScroll(scrollNotification.metrics);
        //   }
        //   return true;
        // },
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          children: List.generate(
            20,
            (index) => Container(
              color: Colors.grey,
              child: Icon(
                Icons.touch_app,
                size: 30,
                color: Colors.yellow[900],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
