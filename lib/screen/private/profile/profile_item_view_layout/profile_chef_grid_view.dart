import 'package:camonta/screen/private/layouts/layout_open_item/profile_me_open_item.dart';
import 'package:camonta/services/http_service.dart';
import 'package:flutter/material.dart';

class ProfileChefItemGridView extends StatefulWidget {
  Map getmyProductRequirementMap;
  ProfileChefItemGridView({Key? key, required this.getmyProductRequirementMap})
      : super(key: key);

  @override
  _ProfileChefItemGridViewState createState() =>
      _ProfileChefItemGridViewState();
}

class _ProfileChefItemGridViewState extends State<ProfileChefItemGridView> {
  final HttpService httpService = HttpService();
  List _myProducts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProfileChefItemGridView oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      _callProducts(widget.getmyProductRequirementMap);
    });
  }

  _callProducts(owneridMap) {
    httpService.getMyProductsAPIfunction(owneridMap).then((value) async => {
          setState(() {
            // print(value);
            if (value['status'] == 'ok') {
              _myProducts = value['body'];
              // print('object');
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _myProducts.isNotEmpty
          ? Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height,
              color: Colors.red,
              // height: 1000,
              child: GridView(
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 3,
                ),
                children: _myProducts.map((e) {
                  return listItem2(e);
                }).toList(),
              ),

              // child: GridView.builder(
              //     shrinkWrap: true,
              //     physics: const ScrollPhysics(),
              //     itemCount: 3,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2),
              //     itemBuilder: (BuildContext context, int index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20.0),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: <Widget>[
              //               Container(
              //                   width: double.infinity,
              //                   height: 50.0,
              //                   color: Colors.grey,
              //                   child: Center(
              //                     child: Text(
              //                       'dsds',
              //                       style: TextStyle(
              //                           color: Colors.white, fontSize: 20.0),
              //                     ),
              //                   )),
              //             ],
              //           ),
              //         ),
              //       );
              //     }),
            )
          : Container(
              height: MediaQuery.of(context).size.width,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  // color: Colors.white,
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Icon(
                          Icons.restaurant,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Meals Added Yet',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget listItem2(_value) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileMeOpenItem(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(0, 0, 0, 0.2),
            ),
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width - 10,
                    // color: Colors.green,
                    child: Text(
                      '_value',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
