import 'package:camonta/services/http_service.dart';
import 'package:flutter/material.dart';

class NewProductPhoto extends StatefulWidget {
  Map newItemInfo;
  NewProductPhoto({Key? key, required this.newItemInfo}) : super(key: key);

  @override
  _NewProductPhotoState createState() => _NewProductPhotoState();
}

class _NewProductPhotoState extends State<NewProductPhoto> {
  final HttpService httpService = HttpService();
  Map _newItemInfo = {};

  @override
  void initState() {
    _newItemInfo = widget.newItemInfo;
    super.initState();
  }

  _uploadNewItemInfo(itemdata) {
    httpService.signupAPIfunction(itemdata).then((value) async => {});
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                openConfirmationDialog(context);

                _uploadNewItemInfo(_newItemInfo);
              },
              child: Text(
                'Upload',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffC50303)),
              ),
            ),
          ),
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
                  ),
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
                      children: List.generate(
                        3,
                        (index) => Container(
                          color: Colors.grey,
                          child: Icon(
                            Icons.touch_app,
                            size: 30,
                            color: Colors.yellow[900],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 50),
              // bottom: 0
              child: Container(
                height: 70,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        onPressed: () {},
                        child: Icon(Icons.camera_alt),
                      ),
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
  openConfirmationDialog(BuildContext context) {
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
                Container(
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
                            'Yes',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close
                        openUploadSuccessDialog(context);
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
                        // openConfirmationDialog(context);
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
}
