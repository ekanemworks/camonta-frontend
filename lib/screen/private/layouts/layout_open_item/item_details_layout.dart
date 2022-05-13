import 'dart:convert';

import 'package:camonta/services/http_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDetailsLayout extends StatefulWidget {
  Map productdetails;
  ItemDetailsLayout({Key? key, required this.productdetails}) : super(key: key);
  @override
  _ItemDetailsLayoutState createState() => _ItemDetailsLayoutState();
}

class _ItemDetailsLayoutState extends State<ItemDetailsLayout> {
  final HttpService httpService = HttpService();
  List productPhotos = [];
  String productItem = '';
  String productCaption = '';
  String productOwnerUsername = '';
  String productOwnerVerificationStatus = '';
  String productOwnerprofilePhoto = '';
  String _walletCurrency = '';
  int productPrice = 0;
  int productRating = 0;

  @override
  void initState() {
    productPhotos = json.decode(widget.productdetails['productPhotos']);
    productItem = widget.productdetails['productItem'];
    productCaption = widget.productdetails['productCaption'];
    productPrice = widget.productdetails['productPrice'];
    productRating = widget.productdetails['productRating'];
    productOwnerUsername = widget.productdetails['profileUsername'];
    productOwnerVerificationStatus =
        widget.productdetails['profileVerificationStatus'];
    productOwnerprofilePhoto = widget.productdetails['profilePhoto'];

    if (widget.productdetails['productCountry'] == 'Nigeria') {
      // FOR nigeria Naira
      _walletCurrency = '₦';
    } else if (widget.productdetails['productCountry'] == 'Ghana') {
      // FOR Ghana Cedi
      _walletCurrency = '¢';
    } else if (widget.productdetails['productCountry'] == 'Kenya') {
      // FOR Kenya Shilling
      _walletCurrency = 'KSh';
    } else if (widget.productdetails['productCountry'] == 'South Africa') {
      // FOR SouthAfrica Rand
      _walletCurrency = 'R';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Description
        // Description
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                ),
                // color: Colors.purple,
                // child: Image.asset('assets/default.png'),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: productOwnerprofilePhoto == ''
                      ? Image.asset(
                          'assets/default_dp.png',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          httpService.serverAPI + productOwnerprofilePhoto,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Text(
                ' @' + productOwnerUsername,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Container(
          child: Container(
            color: Colors.grey.shade200,
            margin: EdgeInsets.only(top: 20),
            height: 260,
            child: CarouselSlider.builder(
              itemCount: productPhotos.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    // in container if you want to show a background image you need box decoration
                    image: productPhotos.isEmpty
                        ? const DecorationImage(
                            image: AssetImage("assets/product_default.png"),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: NetworkImage(
                                httpService.serverAPI + productPhotos[index]),
                            fit: BoxFit.cover,
                          ),
                  ),
                  // child: Text('$index'),
                );
              },
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 5),
              ),
            ),
          ),
        ),
        // Name of Food/ Item
        // Name of Food/ Item
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 40),
          child: Text(
            productItem,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Description
        // Description
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10),
          child: Text(
            productCaption,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
        ),
        // Price and Rating
        // Price and Rating
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _walletCurrency +
                    ' ' +
                    productPrice.toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffF29D38),
                      size: 30,
                    ),
                    Text(
                      productRating.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
