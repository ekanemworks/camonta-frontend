import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:flutter/material.dart';

class ProfileChefItemGridView extends StatefulWidget {
  List myProducts;
  ProfileChefItemGridView({Key? key, required this.myProducts})
      : super(key: key);

  @override
  _ProfileChefItemGridViewState createState() =>
      _ProfileChefItemGridViewState();
}

class _ProfileChefItemGridViewState extends State<ProfileChefItemGridView> {
  List _myProducts = [];

  @override
  void initState() {
    _myProducts = widget.myProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _myProducts.isNotEmpty
          ? Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height,
              // height: 1000,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 3),
                children: _myProducts.map((e) {
                  return listItem2(e);
                }).toList(),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.width,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  // color: Colors.white,
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Icon(
                          Icons.restaurant,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Meals Added Yet',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget listItem2(_value) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileMeOpenItem(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(0, 0, 0, 0.2),
            ),
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width - 10,
                    // color: Colors.green,
                    child: Text(
                      _value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
