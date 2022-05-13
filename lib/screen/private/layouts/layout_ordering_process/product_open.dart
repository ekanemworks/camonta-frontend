import 'package:camonta/screen/private/home.dart';
import 'package:camonta/screen/private/layouts/layout_open_item/item_details_layout.dart';
import 'package:camonta/services/cart_management.dart';
import 'package:flutter/material.dart';

class ProductOpen extends StatefulWidget {
  Map productdetails;
  ProductOpen({Key? key, required this.productdetails}) : super(key: key);
  @override
  _ProductOpenState createState() => _ProductOpenState();
}

class _ProductOpenState extends State<ProductOpen> {
  final CartManagement cartMgt = CartManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              ItemDetailsLayout(productdetails: widget.productdetails)
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xffC50303),
          borderRadius: BorderRadius.circular(23.0),
          border: Border.all(
            color: Color(0xffC50303),
          ),
        ),
        child: SizedBox(
          width: double.maxFinite, // <-- Your width
          height: 50,
          child: ElevatedButton(
            child: Row(
              children: [
                const Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(Icons.shopping_cart)
              ],
            ),
            onPressed: () {
              // final navigationState = navigationKey.currentState;
              // navigationState.setPage(0);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                    initialNavIndex: 2,
                  ),
                ),
              );
              // cartMgt.getCart().then(
              //       (value) => {
              //         if (value != 'empty')
              //           {
              //             cartMgt.setCart(widget.productdetails),
              //           }
              //         else
              //           {
              //             cartMgt.addToCart(
              //               widget.productdetails,
              //             )
              //           }
              //       },
              //     );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
