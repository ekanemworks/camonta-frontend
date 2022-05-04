import 'package:camonta/screen/private/profile/add_product/newproduct_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewProductInfo extends StatefulWidget {
  @override
  _NewProductInfoState createState() => _NewProductInfoState();
}

class _NewProductInfoState extends State<NewProductInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _profileEmail;

  String _mealCategoryHolder = '';
  String _mealItemHolder = 'Select Item';
  final List _mealItem = [
    'Select Item',
    '',
    'Ewa Agoyin',
    'Fried rice',
    'Jollof rice',
    'White rice',
    'Ofada rice',
    'Macaroni',
    'Spaghetti',
    'Eba',
    'Amala',
    'Fufu',
    'Pounded Yam',
    'Semolina | Semovita',
    'Beef',
    'Chicken',
    'Fish',
    'Grilled foods | Barbecue',
    'Beans porridge',
    'Plantain porridge',
    'Potato porridge',
    'Yam porridge',
    'Dodo',
    'Fried plantain',
    'MoiMoi',
    'Salad',
    'Pizza',
    'Burger',
    'Hot dog',
    'Kebab',
    'Doughnut',
    'Burrito',
    'French fries',
    'Taco'
  ]; // List of items to show in dropdownlist

  late String _caption;
  late int _time;
  late int _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, // 1
        elevation: 0,
        title: Text(
          'New Item',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Meal Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 450,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // CAPTION
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          // initialValue: _edit_fullname,

                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          minLines: 2,
                          maxLines: 3,
                          maxLength: 50,
                          decoration:
                              const InputDecoration(labelText: 'Caption'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Caption cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            _caption = value!;
                          },
                        ),
                      ),

                      // ITEMS
                      Container(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 4, left: 10, right: 10),
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(Icons.arrow_circle_down_outlined),
                            value: _mealItemHolder,
                            isExpanded: true,
                            onChanged: (dynamic value) {
                              setState(() {
                                _mealItemHolder = value!;

                                if (_mealItemHolder == 'Ewa Agoyin' ||
                                    _mealItemHolder == 'Fried rice' ||
                                    _mealItemHolder == 'Jollof rice' ||
                                    _mealItemHolder == 'White rice' ||
                                    _mealItemHolder == 'Ofada rice') {
                                  setState(() {
                                    _mealCategoryHolder = 'Grains';
                                  });
                                } else if (_mealItemHolder == 'Macaroni' ||
                                    _mealItemHolder == 'Spaghetti') {
                                  setState(() {
                                    _mealCategoryHolder = 'Pasta';
                                  });
                                } else if (_mealItemHolder == 'Eba' ||
                                    _mealItemHolder == 'Amala' ||
                                    _mealItemHolder == 'Fufu' ||
                                    _mealItemHolder == 'Pounded Yam' ||
                                    _mealItemHolder == 'Semolina | Semovita') {
                                  setState(() {
                                    _mealCategoryHolder = 'Swallow';
                                  });
                                } else if (_mealItemHolder == 'Beef' ||
                                    _mealItemHolder == 'Chicken' ||
                                    _mealItemHolder == 'Fish' ||
                                    _mealItemHolder ==
                                        'Grilled foods | Barbecue') {
                                  setState(() {
                                    _mealCategoryHolder = 'Meats';
                                  });
                                } else if (_mealItemHolder ==
                                        'Beans porridge' ||
                                    _mealItemHolder == 'Plantain porridge' ||
                                    _mealItemHolder == 'Potato porridge' ||
                                    _mealItemHolder == 'Yam porridge') {
                                  setState(() {
                                    _mealCategoryHolder = 'Porridge';
                                  });
                                } else if (_mealItemHolder == 'Dodo' ||
                                    _mealItemHolder == 'Fried plantain' ||
                                    _mealItemHolder == 'MoiMoi' ||
                                    _mealItemHolder == 'Salad') {
                                  setState(() {
                                    _mealCategoryHolder = 'Toppings';
                                  });
                                } else if (_mealItemHolder == 'Pizza' ||
                                    _mealItemHolder == 'Burger' ||
                                    _mealItemHolder == 'Hot dog' ||
                                    _mealItemHolder == 'Doughnut' ||
                                    _mealItemHolder == 'Burrito' ||
                                    _mealItemHolder == 'French fries' ||
                                    _mealItemHolder == 'Taco' ||
                                    _mealItemHolder == 'Kebab') {
                                  setState(() {
                                    _mealCategoryHolder = 'Fast Food';
                                  });
                                } else {
                                  setState(() {
                                    _mealCategoryHolder = 'Soup';
                                  });
                                }
                              });
                            },
                            items: _mealItem.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      Container(
                        // color: Colors.red,
                        width: double.maxFinite,
                        padding: EdgeInsets.only(top: 15),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 13),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Category: ',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                              _mealCategoryHolder != 'Select Item'
                                  ? TextSpan(
                                      text: _mealCategoryHolder,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple),
                                    )
                                  : const TextSpan(
                                      text: '',
                                    ),
                            ],
                          ),
                        ),
                      ),
                      // PREPARATION TIME
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: TextFormField(
                          // initialValue: _edit_username,
                          decoration: const InputDecoration(
                              labelText:
                                  'Preparation Time in minutes (optional)',
                              suffixText: 'Mins'),

                          onSaved: (value) {
                            _time = int.parse(value!);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            prefixText: '₦ ',
                            hintText: "Amount",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'price cannot be empty';
                            }
                          },
                          onSaved: (value) {
                            _price = int.parse(value!);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 44,
                        width: 150,
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
                          border: Border.all(
                            color: Color(0xffC50303),
                          ),
                        ),
                        child: SizedBox(
                          width: double.maxFinite, // <-- Your width
                          height: 44,
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_right_alt)
                              ],
                            ),
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _formKey.currentState!.save();

                              var newItemInfo = {
                                'caption': _caption,
                                'item': _mealItemHolder,
                                'category': _mealCategoryHolder,
                                'preparationtime': _time,
                                'mealprice': _price
                              };

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewProductPhoto(newItemInfo: newItemInfo),
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

                      // Text(mapdata.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
