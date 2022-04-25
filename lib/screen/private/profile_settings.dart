import 'package:camonta/screen/public/startScreen.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SessionManagement sessionMgt = SessionManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                // openConfirmationDialog(context);
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
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Security: Change Password',
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
                              labelText: 'Enter Current Password'),
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
                              labelText: 'Enter New Password'),
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

                      const SizedBox(height: 50),
                      OutlinedButton(
                        onPressed: () {
                          sessionMgt.destroySession();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StartScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Log out',
                          style: TextStyle(color: Colors.black54),
                        ),
                      )

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
