import 'package:http/http.dart';
import 'package:http/http.dart' as http; // for the image function
import 'dart:convert';
import 'dart:io';

class HttpService {
  // FOR IOS AND CHROME WEB : LOCALHOST WORKS FINE
  // FOR IOS AND CHROME WEB : LOCALHOST WORKS FINE
  // FOR IOS AND CHROME WEB : LOCALHOST WORKS FINE
  final String serverAPI = "http://localhost:3000/";
  final String serverAPI_image = "http://localhost:3000/";
  final String uikey = 'billionairesservicetohumanity2022';

  // FOR ANDRIOD AVD cos ANDROID EMULATOR has issues with localhost
  // FOR ANDRIOD AVD cos ANDROID EMULATOR has issues with localhost
  // FOR ANDRIOD AVD cos ANDROID EMULATOR has issues with localhost
  // final String serverAPI = "http://10.0.2.2:3000/";
  // final String serverAPI_image = "http://10.0.2.2:3000/";

  // USING SPECIFIC IP ADDRESS
  // USING SPECIFIC IP ADDRESS
  // USING SPECIFIC IP ADDRESS
  // final String serverAPI = "http://192.168.8.197:3000/";
  // final String serverAPI_image = "http://192.168.8.197:3000/";
  // final String serverAPI = "http://192.168.0.126:3000/";
  // final String serverAPI_image = "http://192.168.0.126:3000/";

  // SIGNUP NEW USER
  // SIGNUP NEW USER
  // SIGNUP NEW USER
  Future signupAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/signup/createAccount'),
        headers: {"Content-Type": "application/json", "uikey": uikey},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // LOG IN USER
  // LOG IN USER
  // LOG IN USER
  Future loginAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/login/Authenticate'),
        headers: {"Content-Type": "application/json", "uikey": uikey},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // EDIT PROFILE
  // EDIT PROFILE
  // EDIT PROFILE
  Future editProfileAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/editprofile/saveInformation'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
          "session": data['profileSession']
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // ADD PRODUCT
  // ADD PRODUCT
  // ADD PRODUCT
  Future addProductAPIfunction(data) async {
    Response response;
    try {
      print('inside API function');
      response = await post(
        Uri.parse(serverAPI + 'api1.0/addproduct/addProductInformation'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
          "session": data['profileSession']
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // GET TERRITORIES
  // GET TERRITORIES
  // GET TERRITORIES
  Future getTerritoriesAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/appbase/getTerritories'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
          "session": data['profileSession']
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // GET MY PRODUCTS
  // GET MY PRODUCTS
  // GET MY PRODUCTS
  Future getMyProductsAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/getproducts/getMyProducts'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
          "session": data['profileSession']
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // GET MY WALLET
  // GET MY WALLET
  // GET MY WALLET
  Future getMyWalletAPIfunction(data) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/wallet/getMyWallet'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
          "session": data['profileSession']
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // GET CHEFS
  // GET CHEFS
  // GET CHEFS
  Future getChefsAPIfunction() async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI + 'api1.0/feeds/getChefs'),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }

  // GET RECOMMENDATION
  // GET RECOMMENDATION
  // GET RECOMMENDATION
  Future getRecommendationsAPIfunction(page) async {
    Response response;
    try {
      response = await post(
        Uri.parse(serverAPI +
            'api1.0/feeds/getRecommendations/' +
            page['page'].toString()),
        headers: {
          "Content-Type": "application/json",
          "uikey": uikey,
        },
        body: json.encode(page),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'network / error 500'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }
}
