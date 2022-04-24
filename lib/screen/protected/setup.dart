import 'dart:convert';

import 'package:camonta/screen/private/dashboard.dart';
import 'package:camonta/screen/private/home.dart';
import 'package:camonta/screen/private/logistics/logistics_dashboard.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class SetupAccount extends StatefulWidget {
  Map signupData1;
  SetupAccount({Key? key, required this.signupData1}) : super(key: key);

  @override
  _SetupAccountState createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final HttpService httpService = HttpService();
  final SessionManagement sessionMgt = SessionManagement();

  late String _edit_profilephoto;
  late String _profileName;
  late String _profileUsername;
  String _profilePhoto = '';
  late String _profileBio;
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
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
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
                            _profileUsername = value!;
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
                            _profileBio = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_username,
                          decoration:
                              const InputDecoration(labelText: 'Set Password'),
                          obscureText: true,
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

                              var signupdata = {
                                'profileEmail': _mapdata['email'],
                                'profileType': _mapdata['accounttype'],
                                'profileName': _profileName,
                                'profileUsername': _profileUsername,
                                'profilePhoto': _profilePhoto,
                                'profileBio': _profileBio,
                                'password': _password,
                              };

                              httpService
                                  .signupAPIfunction(signupdata)
                                  .then((value) async => {
                                        if (value['status'] == 'ok')
                                          {
                                            sessionMgt.setSession({
                                              'id': value['body']['id'],
                                              'profileType': value['body']
                                                  ['profileType'],
                                              'profileSession': value['body']
                                                  ['profileSession'],
                                              'profileName': value['body']
                                                  ['profileName'],
                                              'profileUsername': value['body']
                                                  ['profileUsername'],
                                              'profilePhoto': value['body']
                                                  ['profilePhoto'],
                                              'profileBio': value['body']
                                                  ['profileBio'],
                                              'profileEmail': value['body']
                                                  ['profileEmail'],
                                              'profileEmailStatus':
                                                  value['body']
                                                      ['profileEmailStatus'],
                                              'password': value['body']
                                                  ['password'],
                                              'registrationDate': value['body']
                                                  ['registrationDate'],
                                              'notification': json.decode(
                                                  value['body']
                                                      ['notification']),
                                              'myProductCount': value['body']
                                                  ['myProductCount'],
                                              'myPurchase': json.decode(
                                                  value['body']['myPurchase']),
                                              'profileLikeForIdList':
                                                  json.decode(value['body']
                                                      ['profileLikeForIdList']),
                                              'profileLikeByIdList':
                                                  json.decode(value['body']
                                                      ['profileLikeByIdList']),
                                              'profileServes': value['body']
                                                  ['profileServes'],
                                              'profilePoints': value['body']
                                                  ['profilePoints'],
                                            }),

                                            // FOR NORMAL ACCOUNT
                                            // FOR NORMAL ACCOUNT
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Home(),
                                              ),
                                            )
                                          }
                                        else
                                          {
                                            _showToast(
                                                context, value['message'])
                                          }
                                      });

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

  void _showToast(BuildContext context, message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Close', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
    print(context);
  }
}
