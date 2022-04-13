import 'package:camonta/screen/private/dashboard.dart';
import 'package:camonta/screen/private/home.dart';
import 'package:camonta/screen/private/logistics/logistics_dashboard.dart';
import 'package:flutter/material.dart';

class SetupAccount extends StatefulWidget {
  Map signupData1;
  SetupAccount({Key? key, required this.signupData1}) : super(key: key);

  @override
  _SetupAccountState createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  late String _edit_profilephoto;
  late String _profileName;
  late String _userName;
  late String _bio;
  late String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map _mapdata = {};

  @override
  void initState() {
    setState(() {
      _mapdata = widget.signupData1;
    });

    super.initState();
  }

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
          height: 650,
          // color: Colors.red,
          width: double.maxFinite - 100,
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                        height: 30,
                        width: 30,
                        child: Icon(Icons.camera_alt,
                            color: Colors.white, size: 15),
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.deepPurple,
                // width: 100,
                // margin: const EdgeInsets.only(left: 40, right: 40),
                height: 450,
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
                              labelText: 'Profile Name (full name)'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Profile name cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            _profileName = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_username,
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'username cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            _userName = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_bio,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          minLines: 1,
                          maxLines: 3,
                          maxLength: 100,
                          decoration: const InputDecoration(
                              labelText: 'Bio (limit 100 characters)'),
                          onSaved: (value) {
                            _bio = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_username,
                          decoration:
                              const InputDecoration(labelText: 'Set Password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffC50303),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: SizedBox(
                          width: 190, // <-- Your width
                          height: 50,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.celebration)
                              ],
                            ),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();

                              //  var signupdata = {
                              //                     'yearofbirth': _mapdata['yearofbirth'],
                              //                     'country': _mapdata['country'],
                              //                     'university': _mapdata['university'],
                              //                     'fullname': _reg_fullname,
                              //                     'email': _reg_email,
                              //                     'gender': myInitialGender,
                              //                     'password': _reg_password,
                              //                   };
                              // FOR NORMAL ACCOUNT
                              // FOR NORMAL ACCOUNT
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );

                              // FOR LOGISTICS ACCOUNT
                              // FOR LOGISTICS ACCOUNT
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => LogisticDashboard(),
                              //   ),
                              // );
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
}
