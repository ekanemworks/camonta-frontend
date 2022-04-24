import 'dart:convert';

import 'package:camonta/screen/private/home.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final HttpService httpService = HttpService();
  final SessionManagement sessionMgt = SessionManagement();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _profileEmail;
  late String _password;

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
          child: Center(
            child: Container(
              height: 600,
              width: double.maxFinite - 100,
              margin: const EdgeInsets.only(left: 40, right: 40),
              // color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(bottom: 124),
                    decoration: BoxDecoration(
                      // in container if you want to show a background image you need box decoration
                      image: DecorationImage(
                          image: AssetImage('assets/logo/mainlogo2.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // phone number
                              Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter an Email';
                                    }

                                    if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return 'Please enter a valid Email';
                                    }
                                  },
                                  onSaved: (value) {
                                    _profileEmail = value!;
                                  },
                                ),
                              ),
                              // phone number
                              Padding(
                                padding: const EdgeInsets.only(top: 23),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a password';
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
                                  width: 120, // <-- Your width
                                  height: 50,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Log In',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      _formKey.currentState!.save();

                                      var loginValues = {
                                        'profileEmail': _profileEmail,
                                        'password': _password,
                                      };

                                      print(loginValues);

                                      httpService
                                          .loginAPIfunction(loginValues)
                                          .then((value) async => {
                                                print('ekanem'),

                                                if (value['status'] == 'ok')
                                                  {
                                                    // print(value['body']),
                                                    // use session management class to set session
                                                    // use session management class to set session
                                                    sessionMgt.setSession({
                                                      'id': value['body']['id'],
                                                      'profileType':
                                                          value['body']
                                                              ['profileType'],
                                                      'profileSession': value[
                                                              'body']
                                                          ['profileSession'],
                                                      'profileName':
                                                          value['body']
                                                              ['profileName'],
                                                      'profileUsername': value[
                                                              'body']
                                                          ['profileUsername'],
                                                      'profilePhoto':
                                                          value['body']
                                                              ['profilePhoto'],
                                                      'profileBio':
                                                          value['body']
                                                              ['profileBio'],
                                                      'profileEmail':
                                                          value['body']
                                                              ['profileEmail'],
                                                      'profileEmailStatus': value[
                                                              'body'][
                                                          'profileEmailStatus'],
                                                      'password': value['body']
                                                          ['password'],
                                                      'registrationDate': value[
                                                              'body']
                                                          ['registrationDate'],
                                                      'notification': json
                                                          .decode(value['body']
                                                              ['notification']),
                                                      'myProductCount': value[
                                                              'body']
                                                          ['myProductCount'],
                                                      'myPurchase': json.decode(
                                                          value['body']
                                                              ['myPurchase']),
                                                      'profileLikeForIdList':
                                                          json.decode(value[
                                                                  'body'][
                                                              'profileLikeForIdList']),
                                                      'profileLikeByIdList':
                                                          json.decode(value[
                                                                  'body'][
                                                              'profileLikeByIdList']),
                                                      'profileServes':
                                                          value['body']
                                                              ['profileServes'],
                                                      'profilePoints':
                                                          value['body']
                                                              ['profilePoints'],
                                                    }),

                                                    // FOR NORMAL ACCOUNT
                                                    // FOR NORMAL ACCOUNT
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(),
                                                      ),
                                                    )
                                                  }
                                                else
                                                  {
                                                    _showToast(context,
                                                        value['message'])
                                                  }
                                                // if (_password == '')
                                                //   {
                                                //     // FOR NORMAL ACCOUNT
                                                //     // FOR NORMAL ACCOUNT
                                                //     Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) => Home(),
                                                //       ),
                                                //     )
                                                //   }
                                              });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
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
