import 'dart:convert';

import 'package:camonta/screen/private/dashboard.dart';
import 'package:camonta/screen/private/home.dart';
import 'package:camonta/screen/private/logistics/logistics_dashboard.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class SetupAccount extends StatefulWidget {
  Map signupData1;
  SetupAccount({Key? key, required this.signupData1}) : super(key: key);

  @override
  _SetupAccountState createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final HttpService httpService = HttpService();
  final SessionManagement sessionMgt = SessionManagement();
  File? _image;
  String base64Image = '';

  late String _profileName;
  late String _profileUsername;
  late String _profileBio;
  late String _password;
  String _profilePhoto = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map _mapdata = {};

  @override
  void initState() {
    callSession();
    setState(() {
      _mapdata = widget.signupData1;
    });

    super.initState();
  }

  callSession() {
    // use session management class to set session
    // use session management class to set session
    sessionMgt.getSession().then(
          (value) => {
            if (value != 'empty')
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                )
              }
          },
        );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  uploadFromPage(userid) {
    http
        .post(
      Uri.parse(httpService.serverAPI + 'updateProfilePhoto'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"image": base64Image, "userid": userid}),
    )
        .then((value) {
      var mainResponse = json.decode(value.body);

      if (value.statusCode == 200) {
        if (mainResponse['status'] == 'ok') {
          sessionMgt.updateSession(
              'profilePhoto', mainResponse['body']['imagePathOnDB']);

          // FOR NORMAL ACCOUNT
          // FOR NORMAL ACCOUNT
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          _showToast(context, mainResponse['message']);
        }
      } else {
        print('error');
        _showToast(context, mainResponse['message']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        actions: [
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              'Upload',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          )
        ],
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
                child: Stack(
                  children: [
                    _image == null
                        ? Container(
                            decoration: const BoxDecoration(
                              // in container if you want to show a background image you need box decoration
                              image: DecorationImage(
                                image: AssetImage('assets/default_dp.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              height: 120.0,
                              width: 120.0,
                            ),
                          ),
                    Positioned(
                      bottom: 0.0,
                      right: 5.0,
                      child: InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xff0ED50C),
                                Color(0xff078307)
                              ],
                            ),
                            border: Border.all(width: 1, color: Colors.grey),
                            shape: BoxShape.circle,
                          ),
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
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Color(0xffC9024D),
                              Color(0xffAA0040)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(7.0),
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
                                'profileCountry': _mapdata['country'],
                              };

                              httpService
                                  .signupAPIfunction(signupdata)
                                  .then((value) async => {
                                        print(value),
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
                                              'profileCountry': value['body']
                                                  ['profileCountry'],
                                              'profileState': value['body']
                                                  ['profileState'],
                                              'profileRegion': value['body']
                                                  ['profileRegion'],
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

                                            // RECIEVING VALUES FROM SERVER RESPONSE TO USE FOR IMAGE UPLOAD
                                            // RECIEVING VALUES FROM SERVER RESPONSE TO USE FOR IMAGE UPLOAD
                                            if (_image != null)
                                              {
                                                base64Image = base64Encode(
                                                    _image!.readAsBytesSync()),
                                                uploadFromPage(
                                                    value['body']['id']),
                                              }
                                            else
                                              {
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
  }
}
