import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartManagement {
  setCart(cartData) async {
    // here we are adding the cart to a list of Cart Details not assigning it like in the case of session
    List<String> theCart = [];
    theCart.add(json.encode(cartData));

    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList('cartGroupData', theCart);
  }

  getCart() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getStringList('cartGroupData') == null) {
      return 'empty';
    } else {
      return _prefs.getStringList('cartGroupData');
    }
  }

// RE-VISIT THIS TO CLEAR ONLY CART AND NOT ALL: COS IT WOULD INCLUDE SESSION
  destroyCart() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  updateCart(index, bvalue) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getStringList('cartGroupData') == null) {
      return 'empty';
    } else {
      //  this is where the magic begins
      //  this is where the magic begins

      List<String> theCart = _prefs.getStringList('cartGroupData')!;

      // First encode the indexValue, before replaceing the old index
      theCart[index] = json.encode(bvalue);

      // print(stringcartData);
      _prefs.setStringList('cartGroupData', theCart);
      return 'complete';
    }
  }

  addToCart(newValue) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String> theCart = _prefs.getStringList('cartGroupData')!;

    theCart.add(json.encode(newValue));

    _prefs.setStringList('cartGroupData', theCart);
  }
}
