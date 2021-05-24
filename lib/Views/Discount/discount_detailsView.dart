import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:fixurbiz_app/Utility/MyTextFieldDatePicker.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Views/Discount/discount_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../main.dart';
import 'package:get/get.dart';

class DiscountDetailView extends StatefulWidget {
  @override
  _DiscountDetailViewState createState() => _DiscountDetailViewState();
}

class _DiscountDetailViewState extends State<DiscountDetailView> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _title;
  TextEditingController _description;
  TextEditingController _cost;
  TextEditingController _location;
  TextEditingController _city;
  TextEditingController _state;
  TextEditingController _country;
  TextEditingController _zipCode;
  TextEditingController _email;
  TextEditingController _phone;
  TextEditingController _terms;
  String dropdownValue = '5%';
  String friendDropDown = "Yes";
  var str = "product";
  double discount;
  String discountValue;
  double reducePrice;
  double dis;
  double cost;
  String valid;
  String uid;
  List textStr = Get.arguments;
 int redumptionCode;
  @override
  void initState() {
    getPrefsData();
    var rng = new Random();
    redumptionCode = rng.nextInt(900000) + 100000;
    _title = TextEditingController();
    _description = TextEditingController();
    _cost = TextEditingController();
    _location = TextEditingController();
    _city = TextEditingController();
    _state = TextEditingController();
    _country = TextEditingController();
    _zipCode = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _terms = TextEditingController();
    if (textStr.first.toString() == "DiscountType.Product") {
      str = "product";
    } else {
      str = "service";
    }
    super.initState();
  }
  getPrefsData() async{
    final box = GetStorage();
    uid = box.read("userID");

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Discount Details'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.discountView),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height / 0.20,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What is the title of the discounted $str?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _title,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Email");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Write a brief description of the discounted $str (300 characters max)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _description,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "What's the actual cost of the $str (MSRP)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _cost,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "What's the percentage of discount on the $str (MSRP)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              //color: Colors.indigo[800],
                              //margin: const EdgeInsets.all(3.0),
                              //padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: DropdownButton<String>(
                                  hint: Text('Choose'),
                                  // disabledHint: Text('Describe your self',style: TextStyle(color: Colors.white),),
                                  isExpanded: true,
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.black,
                                  iconSize: 30,
                                  elevation: 16,
                                  dropdownColor: Colors.white,

                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    '5%',
                                    '6%',
                                    '7%',
                                    '8%',
                                    '9%',
                                    '10%',
                                    'upto 100%'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Offer Valid until",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            MyTextFieldDatePicker(
                              labelText: "Date",
                              prefixIcon: Icon(Icons.date_range),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              onDateChanged: (selectedDate) {
                                valid = selectedDate.toString();
                              },
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Can the User Refer this Bizcentive to a friend?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.infinity,
                              //color: Colors.indigo[800],
                              //margin: const EdgeInsets.all(3.0),
                              //padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: DropdownButton<String>(
                                  hint: Text('Choose'),
                                  // disabledHint: Text('Describe your self',style: TextStyle(color: Colors.white),),
                                  isExpanded: true,
                                  value: friendDropDown,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.black,
                                  iconDisabledColor: Colors.black,
                                  iconSize: 30,
                                  elevation: 16,
                                  dropdownColor: Colors.white,

                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      friendDropDown = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Yes',
                                    'No',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Which location is this offer available? (Enter Street Address)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _location,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "City",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _city,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "State",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _state,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Country",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _country,

                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Zipcode",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _zipCode,
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Contact Email for this offer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _email,
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Contact Phone for this offer",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _phone,
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                            SizedBox(height: 10),
                            Text(
                              "Please add appropriate terms and conditions for this offer (to help set realistic expectations between you and the buyer)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            _inputField(
                                controller: _terms,
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the field");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    //elevation: 5.0,
                    child: MaterialButton(
                      //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,
                      disabledColor: Colors.indigo.withOpacity(0.3),
                      disabledTextColor: Colors.white54,
                      onPressed: () => {
                      discountValue = dropdownValue.substring(0, dropdownValue.length - 1),
                        dis = double.parse(discountValue),
                        cost = double.parse(_cost.text),
                        discount = cost - dis/100 * cost,

                        FirestoreService().saveCard(
                            str,
                            "Service",
                            "Own",
                            _location.text,
                            _title.text,
                            _description.text,
                            _cost.text,
                            discountValue,
                            "$discount",
                            valid,
                            uid,
                            "$redumptionCode",
                            _phone.text,
                            _email.text,
                            friendDropDown,
                            "",
                            _country.text,
                            false, false, false


                        ),
                        Get.offNamed(PageIdentifier.tabPage),
                      },
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 50.0,
                      color: Colors.indigo,
                      child: Text(
                        "Add a Discount Offering",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inputField(
      {TextEditingController controller,
      String labelText,
      String hintText,
      bool isSecure = false,
      int maxLines = 1,
      Function(String) onSubmitted}) {
    return TextField(
      style: TextStyle(fontSize: 17),
      maxLines: maxLines,

      obscureText: isSecure,
      // decoration: InputDecoration(
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(5)),
      //     borderSide: BorderSide(color: Colors.blue),
      //   ),
      //
      //   labelText: labelText,
      //   hintText: hintText,
      //   hintStyle: TextStyle(fontSize: 13),
      // ),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}
