import 'dart:convert';

import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class ProfileEdit extends StatefulWidget {
  Map data;
  ProfileEdit({Key? key, required this.data}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SessionManagement sessionMgt = SessionManagement();
  final HttpService httpService = HttpService();

  File? _image;
  String base64Image = '';
  late String _profileName;
  late String _profileUsername;
  late String _profileBio;
  late String _profileEmail;
  late String _profilePhoto;

  @override
  void initState() {
    _profileName = widget.data['profileName'];
    _profileUsername = widget.data['profileUsername'];
    _profileBio = widget.data['profileBio'];
    _profileEmail = widget.data['profileEmail'];
    _profilePhoto = widget.data['profilePhoto'];

    super.initState();
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

          _showToast(context, 'Changes Saved');
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
        backgroundColor: Color(0xff840233), // 1 1
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   onPressed: () => Navigator.of(context).pop(true),
        // ),
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                // textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // openConfirmationDialog(context);
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();

                var editData = {
                  'profileName': _profileName,
                  'profileUsername': _profileUsername,
                  'profileBio': _profileBio,
                  'profileEmail': _profileEmail,
                  'profileSession': widget.data['profileSession']
                };

                httpService
                    .editProfileAPIfunction(editData)
                    .then((value) async => {
                          if (value['status'] == 'ok')
                            {
                              // use session management class to set session
                              // use session management class to set session
                              // use session management class to set session
                              sessionMgt.setSession({
                                'id': value['body']['id'],
                                'profileType': value['body']['profileType'],
                                'profileSession': value['body']
                                    ['profileSession'],
                                'profileName': value['body']['profileName'],
                                'profileUsername': value['body']
                                    ['profileUsername'],
                                'profilePhoto': value['body']['profilePhoto'],
                                'profileBio': value['body']['profileBio'],
                                'profileEmail': value['body']['profileEmail'],
                                'profileEmailStatus': value['body']
                                    ['profileEmailStatus'],
                                'password': value['body']['password'],
                                'profileCountry': value['body']
                                    ['profileCountry'],
                                'profileState': value['body']['profileState'],
                                'profileRegion': value['body']['profileRegion'],
                                'registrationDate': value['body']
                                    ['registrationDate'],
                                'notification':
                                    json.decode(value['body']['notification']),
                                'myProductCount': value['body']
                                    ['myProductCount'],
                                'myPurchase':
                                    json.decode(value['body']['myPurchase']),
                                'profileLikeForIdList': json.decode(
                                    value['body']['profileLikeForIdList']),
                                'profileLikeByIdList': json.decode(
                                    value['body']['profileLikeByIdList']),
                                'profileServes': value['body']['profileServes'],
                                'profilePoints': value['body']['profilePoints'],
                                'profileVerificationStatus': value['body']
                                    ['profileVerificationStatus'],
                              }),

                              // RECIEVING VALUES FROM SERVER RESPONSE TO USE FOR IMAGE UPLOAD: checking if image was changed
                              // RECIEVING VALUES FROM SERVER RESPONSE TO USE FOR IMAGE UPLOAD: checking if image was changed
                              if (_image != null)
                                {
                                  base64Image =
                                      base64Encode(_image!.readAsBytesSync()),
                                  uploadFromPage(value['body']['id']),
                                }
                              else
                                {
                                  _showToast(context, 'Changes Saved'),
                                }
                            }
                          else
                            {
                              _showToast(context, value['message']),
                            }
                        });
              },
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          width: double.maxFinite - 100,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    _image == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: _profilePhoto == ''
                                ? Image.asset(
                                    'assets/default_dp.png',
                                    fit: BoxFit.cover,
                                    height: 120.0,
                                    width: 120.0,
                                  )
                                : Image.network(
                                    httpService.serverAPI + _profilePhoto,
                                    fit: BoxFit.cover,
                                    height: 120.0,
                                    width: 120.0,
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
                height: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          initialValue: _profileName,
                          decoration:
                              const InputDecoration(labelText: 'Profile Name'),
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
                          initialValue: _profileUsername,
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
                          initialValue: _profileBio,
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
                          initialValue: _profileEmail,
                          decoration: const InputDecoration(labelText: 'Email'),
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
                      const SizedBox(height: 20),

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
