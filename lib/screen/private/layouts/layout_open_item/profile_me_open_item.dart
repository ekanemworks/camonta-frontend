import 'package:camonta/screen/private/profile/edit_item.dart';
import 'package:camonta/screen/private/layouts/layout_open_item/item_details_layout.dart';
import 'package:flutter/material.dart';

class ProfileMeOpenItem extends StatefulWidget {
  Map productdetails;
  ProfileMeOpenItem({Key? key, required this.productdetails}) : super(key: key);
  @override
  _ProfileMeOpenItemState createState() => _ProfileMeOpenItemState();
}

class _ProfileMeOpenItemState extends State<ProfileMeOpenItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          Container(
            width: 60,
            height: 120,
            margin: const EdgeInsets.only(top: 3, bottom: 3, right: 10),
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
                    child:
                        Icon(Icons.more_horiz, color: Colors.white, size: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Edit Item',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(Icons.create)
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditItem(),
                ),
              );
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
