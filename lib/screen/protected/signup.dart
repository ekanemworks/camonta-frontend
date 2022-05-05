import 'package:camonta/screen/protected/setup.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String accounttypeDropDownHolder = 'Account Type';
  String countryDropDownHolder = 'Pick Country';
  late String _profileEmail;

  final List accountTypeList = [
    'Account Type',
    '',
    'Customer',
    'Chef / Catering',
    'Restaurant',
    'Logistic Company (fee ₦7,000)',
  ]; // List of items to show in dropdownlist

  final List countryList = [
    'Pick Country',
    '',
    'Nigeria',
    'Ghana',
    'Kenya',
    'South Africa',
    'Ethiopia',
  ]; // List of items to show in dropdownlist

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                        'Create Account',
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
                                    return 'Enter a valid Email';
                                  }

                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                },
                                onSaved: (value) {
                                  _profileEmail = value!;
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
                                  value: accounttypeDropDownHolder,
                                  isExpanded: true,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      accounttypeDropDownHolder = value!;
                                    });
                                  },
                                  items: accountTypeList.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                ),
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
                                  value: countryDropDownHolder,
                                  isExpanded: true,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      countryDropDownHolder = value!;
                                    });
                                  },
                                  items: countryList.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                ),
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
                                width: 120, // <-- Your width
                                height: 50,
                                child: ElevatedButton(
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    _formKey.currentState!.save();

                                    if (accounttypeDropDownHolder == '' ||
                                        accounttypeDropDownHolder ==
                                            'Account Type') {
                                      _showToast(context,
                                          "Choose a valid account type");
                                    } else {
                                      var mapdata = {
                                        'email': _profileEmail,
                                        'accounttype':
                                            accounttypeDropDownHolder,
                                        'country': countryDropDownHolder
                                      };

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SetupAccount(
                                              signupData1: mapdata),
                                        ),
                                      );
                                    }
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
    // print(context);
  }
}
