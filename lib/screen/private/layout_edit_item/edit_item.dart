import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Edit Item',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
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
              // Photos
              // Photos
              Container(
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    children: List.generate(
                      3,
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
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_fullname,
                          decoration: const InputDecoration(
                              labelText: 'Name or Caption'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Profile name cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            // _edit_fullname = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_username,
                          decoration: const InputDecoration(
                              labelText: 'Name of expected reciever'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'username cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            // _edit_username = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Text(mapdata.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
