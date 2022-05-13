import 'dart:convert';

import 'package:camonta/screen/private/home.dart';
import 'package:camonta/services/http_service.dart';
import 'package:camonta/services/session_management.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

class NewProductPhoto extends StatefulWidget {
  Map newItemInfo;
  NewProductPhoto({Key? key, required this.newItemInfo}) : super(key: key);

  @override
  _NewProductPhotoState createState() => _NewProductPhotoState();
}

class _NewProductPhotoState extends State<NewProductPhoto> {
  final HttpService httpService = HttpService();
  final SessionManagement sessionMgt = SessionManagement();
  Map _newItemInfo = {};
  File? _imageJumbotron;
  File? _image;
  List<File?> _productImages = [];
  List<String> _base64Images = [];
  bool _displayUploadBtn = false;
  bool _displayCameraBtn = true;
  bool _startProcessing = false;

  @override
  void initState() {
    _newItemInfo = widget.newItemInfo;

    super.initState();
  }

  _uploadNewItemInfo(itemdata) {
    httpService.addProductAPIfunction(itemdata).then((value) async => {
          if (value['status'] == 'ok')
            {
              sessionMgt.updateSession(
                  'myProductCount', (itemdata['myProductCount'] + 1)),
              for (var i = 0; i < _productImages.length; i++)
                {
                  _base64Images
                      .add(base64Encode(_productImages[i]!.readAsBytesSync()))
                },
              _uploadFromPage(value['productCode'], itemdata['productOwnerId'],
                  itemdata['myProductCount'] + 1),
            }
          else
            {
              _showToast(context, value['message']),
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
        title: Text(
          'Add Photos',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          _displayUploadBtn == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      var itemDataMap = {
                        'productClass': 'regular',
                        'productType': 'meal',
                        'productCaption': _newItemInfo['productCaption'],
                        'productItem': _newItemInfo['productItem'],
                        'productCategory': _newItemInfo['productCategory'],
                        'productPreparationtime':
                            _newItemInfo['productPreparationtime'],
                        'productPrice': _newItemInfo['productPrice'],
                        'productCurrency': _newItemInfo['productCurrency'],
                        'productPhotos': '',
                        'productOwnerId': _newItemInfo['productOwnerId'],
                        'productRating': 0,
                        'productHits': 0,
                        'productCountry': _newItemInfo['profileCountry'],
                        'productState': _newItemInfo['profileState'],
                        'productRegion': _newItemInfo['profileRegion'],
                        'profileSession': _newItemInfo['profileSession'],
                        'myProductCount': _newItemInfo['myProductCount']
                      };

                      // _uploadNewItemInfo(itemDataMap);
                      openConfirmationDialog(context, itemDataMap);
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffC50303)),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child: _imageJumbotron == null
                        ? Container(
                            decoration: const BoxDecoration(
                              // in container if you want to show a background image you need box decoration
                              image: DecorationImage(
                                image: AssetImage('assets/product_default.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : ClipRRect(
                            // borderRadius: BorderRadius.circular(120),
                            child: Image.file(
                              _imageJumbotron!,
                              fit: BoxFit.cover,
                              height: 120.0,
                              width: 120.0,
                            ),
                          ),
                  ),
                  _displayUploadBtn == false
                      ? Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Add 2 or more images of Meal',
                            style: TextStyle(
                              color: Color(0xfff3f3f3),
                            ),
                          ),
                        )
                      : Container(),
                  Container(
                    height: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      children: _productImages.map((e) {
                        return Container(
                          color: Colors.grey,
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(120),
                            child: Image.file(
                              e!,
                              fit: BoxFit.cover,
                              height: 120.0,
                              width: 120.0,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 50),
              // bottom: 0
              child: Container(
                height: 75,
                // color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: _displayCameraBtn == true
                          ? FloatingActionButton(
                              backgroundColor: Color(0xffC9024D),
                              onPressed: () {
                                pickImage();
                              },
                              child: Icon(
                                Icons.camera_alt,
                                size: 35,
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // START OF UPLOAD CONFIRMATION DIALOG
  // START OF UPLOAD CONFIRMATION DIALOG
  openConfirmationDialog(BuildContext context, itemdata) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // backgroundColor: Color(0xff411414),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 300,
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _startProcessing == false
                    ? Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        // color: Colors.grey,
                        child: Text(
                          'Are you sure you want to upload this item? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(bottom: 20),
                        alignment: Alignment.center,
                        // color: Colors.grey,
                        child: Text(
                          'please wait, Uploading Item.... ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                _startProcessing == false
                    ? Container(
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
                                  'Yes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onPressed: () {
                              _uploadNewItemInfo(itemdata);
                              setState(() {
                                _startProcessing = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
  // END OF UPLOAD CONFIRMATION DIALOG
  // END OF UPLOAD CONFIRMATION DIALOG

  // START OF UPLOAD SUCCESS DIALOG
  // START OF UPLOAD SUCCESS DIALOG
  openUploadSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xff411414),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 400,
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    image: DecorationImage(
                      image: AssetImage('assets/addproduct.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Success',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Your product has been successfully added',
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: 15,
                    ),
                  ),
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
                            'Okay',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onPressed: () {
                        // FOR NORMAL ACCOUNT
                        // FOR NORMAL ACCOUNT
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(initialNavIndex: 0),
                          ),
                        );
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
  // END OF UPLOAD SUCCESS DIALOG
  // END OF UPLOAD SUCCESS DIALOG

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

  // PICK IMAGE FUNCTION: TO PICK PRODUCT IMAGE
  // PICK IMAGE FUNCTION: TO PICK PRODUCT IMAGE
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      // checking if the image file variable is empty to assign it for image 1, image 2 and image3
      setState(() {
        _imageJumbotron = imageTemporary;
        _productImages.add(_imageJumbotron);
      });

      if (_productImages.length >= 2) {
        setState(() {
          _displayUploadBtn = true;
        });
      }

      if (_productImages.length == 3) {
        setState(() {
          _displayCameraBtn = false;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // UPLOAD IMAGE FUNCTION: TO UPLOAD PRODUCT IMAGE calling http, sending packet of data
  // UPLOAD IMAGE FUNCTION: TO UPLOAD PRODUCT IMAGE calling http, sending packet of data
  _uploadFromPage(productCode, productOwnerid, myProductCount) {
    http
        .post(
      Uri.parse(httpService.serverAPI + 'uploadProductPhoto'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "imageList": json.encode(_base64Images),
        "productCode": productCode,
        "productOwnerid": productOwnerid,
        "myProductCount": myProductCount
      }),
    )
        .then((value) {
      var mainResponse = json.decode(value.body);

      if (value.statusCode == 200) {
        if (mainResponse['status'] == 'ok') {
          Navigator.pop(context); // Close
          openUploadSuccessDialog(context);
        } else {
          _showToast(context, mainResponse['message']);
        }
      } else {
        print('error');
        _showToast(context, mainResponse['message']);
      }
    });
  }
}
