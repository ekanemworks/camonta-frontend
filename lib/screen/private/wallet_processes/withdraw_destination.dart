import 'package:flutter/material.dart';

class WithdrawDestination extends StatefulWidget {
  @override
  _WithdrawDestinationState createState() => _WithdrawDestinationState();
}

class _WithdrawDestinationState extends State<WithdrawDestination> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String myInitialHolder = 'Account Type';

  final List myItems = [
    'Account Type',
    '',
    'Customer Account    - free ₦0',
    'Chef/Vendor Account - free ₦0',
    'Logistic Company (fee ₦7,000)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Withdraw',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Bank Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // color: Colors.deepPurple,
                // width: 100,
                // margin: const EdgeInsets.only(left: 40, right: 40),
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
                              labelText: 'Account Number'),
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
                          decoration:
                              const InputDecoration(labelText: 'Account Name'),
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
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 6, left: 20, right: 20),
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(Icons.arrow_circle_down_outlined),
                            value: myInitialHolder,
                            isExpanded: true,
                            onChanged: (dynamic value) {
                              setState(() {
                                myInitialHolder = value!;
                              });
                            },
                            items: myItems.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffC50303),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: SizedBox(
                          width: 200, // <-- Your width
                          height: 50,
                          child: ElevatedButton(
                            child: const Text(
                              'Withdraw Money',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              openWithdrawConfirmationProcessing(context);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                          ),
                        ),
                      ),

                      // Text(mapdata.toString()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // START OF ORDER CONFIRMATION DIALOG
  // START OF ORDER CONFIRMATION DIALOG
  openWithdrawConfirmationProcessing(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xff411414),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 480,
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.only(top: 34),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    image: DecorationImage(
                      image:
                          AssetImage('assets/processing/hourglassyellow.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Processing',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: 100,
                  width: 350,
                  padding: EdgeInsets.only(bottom: 20),
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This withdrawal request is being processed',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Processing Time: 2 days',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
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
                            'okay',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onPressed: () {
                        openWithdrawConfirmationProcessing(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // END OF ORDER CONFIRMATION DIALOG
  // END OF ORDER CONFIRMATION DIALOG
}
