import 'dart:convert';

import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

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

  late String _profileName;
  late String _profileUsername;
  late String _profileBio;
  late String _profileEmail;

  @override
  void initState() {
    _profileName = widget.data['profileName'];
    _profileUsername = widget.data['profileUsername'];
    _profileBio = widget.data['profileBio'];
    _profileEmail = widget.data['profileEmail'];

    super.initState();
  }

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
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

                if (_profileName == widget.data['profileName']) {}

                print(editData);

                httpService
                    .editProfileAPIfunction(editData)
                    .then((value) async => {});
              },
              child: Text(
                'Save',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffC50303)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
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
}
