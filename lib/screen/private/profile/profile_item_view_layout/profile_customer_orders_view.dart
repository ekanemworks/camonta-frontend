import 'package:flutter/material.dart';

class ProfileCustomerItemOrders extends StatefulWidget {
  List myOrders;
  ProfileCustomerItemOrders({Key? key, required this.myOrders})
      : super(key: key);

  @override
  _ProfileCustomerItemOrdersState createState() =>
      _ProfileCustomerItemOrdersState();
}

class _ProfileCustomerItemOrdersState extends State<ProfileCustomerItemOrders> {
  List _myOrders = [];

  @override
  void initState() {
    _myOrders = widget.myOrders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _myOrders.isNotEmpty
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
                children: _myOrders.map((e) {
                  return listItem2(e);
                }).toList(),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Icon(
                          Icons.shopping_bag,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Order Is Pending',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
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
      onTap: () {},
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
