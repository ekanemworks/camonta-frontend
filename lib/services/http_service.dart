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

  // GET COUNTRIES
  // GET COUNTRIES
  // GET COUNTRIES
  Future fetchSignupCriteria() async {
    Response response;
    try {
      response =
          await get(Uri.parse(serverAPI + 'api1.0/signup/signupCriteria'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      return {'status': 'error', 'message': 'network error / server error'};
    }
  }
}
