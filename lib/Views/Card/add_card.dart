import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../../main.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _bizcentiveType;
  TextEditingController _bizcentiveSubType;
  TextEditingController _source;
  TextEditingController _location;
  TextEditingController _title;
  TextEditingController _description;
  TextEditingController _regularPrice;
  TextEditingController _discount;
  TextEditingController _reducedPrice;
  TextEditingController _validFor;
  TextEditingController _bezcentiveID;
  TextEditingController _redemptionID;
  TextEditingController _phone;
  TextEditingController _email;
  TextEditingController _company;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bizcentiveType = TextEditingController();
    _bizcentiveSubType = TextEditingController();
    _source = TextEditingController();
    _location = TextEditingController();
    _title = TextEditingController();
    _description = TextEditingController();
    _regularPrice = TextEditingController();
    _discount = TextEditingController();
    _reducedPrice = TextEditingController();
    _validFor = TextEditingController();
    _bezcentiveID = TextEditingController();
    _redemptionID = TextEditingController();
    _phone = TextEditingController();
    _email = TextEditingController();
    _company = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Bizcentive Card'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.tabPage),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        //height: 300,
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _inputField(
                                controller: _bizcentiveType,
                                hintText: "Enter type.",
                                labelText: "Enter type",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _bizcentiveSubType,
                                hintText: "Enter Subtype.",
                                labelText: "Enter Subtype",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _source,
                                hintText: "Enter Source.",
                                labelText: "Enter Source",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _location,
                                hintText: "Enter Location.",
                                labelText: "Enter Location",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _title,
                                hintText: "Enter Title.",
                                labelText: "Enter Title",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _description,
                                hintText: "Enter Description.",
                                labelText: "Enter Description",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _regularPrice,
                                hintText: "Enter Regular Price.",
                                labelText: "Enter Regular Price",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _discount,
                                hintText: "Enter Discount.",
                                labelText: "Enter Discount",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _reducedPrice,
                                hintText: "Enter Reduced Price.",
                                labelText: "Enter Reduced Price",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _validFor,
                                hintText: "Valid for.",
                                labelText: "Valid for",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _bezcentiveID,
                                hintText: "Enter Bezcentive ID.",
                                labelText: "Enter Bezcentive ID",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _redemptionID,
                                hintText: "Enter Redemption ID.",
                                labelText: "Enter Redemption ID",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _phone,
                                hintText: "Enter Phone.",
                                labelText: "Enter Phone",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _email,
                                hintText: "Enter Email.",
                                labelText: "Enter Email",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Subtype");
                                  }
                                }),
                            SizedBox(height: 10),
                            _inputField(
                                controller: _company,
                                hintText: "Enter Company.",
                                labelText: "Enter Company",
                                onSubmitted: (value) {
                                  if (!value.isNotEmpty) {
                                    Get.snackbar(
                                        "Alert", "Please fill the Type");
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
                        FirestoreService().saveCard(
                            _bizcentiveType.text,
                            _bizcentiveSubType.text,
                            _source.text,
                            _location.text,
                            _title.text,
                            _description.text,
                            _regularPrice.text,
                            _discount.text,
                            _reducedPrice.text,
                            _validFor.text,
                            _bezcentiveID.text,
                            _redemptionID.text,
                            _phone.text,
                            _email.text,
                            _company.text),
                        Get.offNamed(PageIdentifier.profile),
                      },
                      minWidth: MediaQuery.of(context).size.width / 2,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 50.0,
                      color: Colors.indigo,
                      child: Text(
                        "Add",
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
      TextInputType keyboardType = TextInputType.text,
      Icon prefixIcon,
      Icon suffixIcon,
      Function onSuffixIconClick,
      Function(String) onSubmitted}) {
    return TextField(
      style: TextStyle(fontSize: 17),
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: isSecure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsetsDirectional.only(end: 12),
                child: IconButton(
                  icon: suffixIcon,
                  onPressed: onSuffixIconClick,
                ),
              ),
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13),
      ),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}
