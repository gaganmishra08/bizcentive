import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import 'package:get/get.dart';

class ReferView extends StatefulWidget {
  @override
  _ReferViewState createState() => _ReferViewState();
}

class _ReferViewState extends State<ReferView> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _emailController1;
  TextEditingController _nameController1;
  TextEditingController _businessController1;
  TextEditingController _emailController2;
  TextEditingController _nameController2;
  TextEditingController _businessController2;
  TextEditingController _emailController3;
  TextEditingController _nameController3;
  TextEditingController _businessController3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController1 = TextEditingController();
    _nameController1 = TextEditingController();
    _businessController1 = TextEditingController();
    _emailController2 = TextEditingController();
    _nameController2 = TextEditingController();
    _businessController2 = TextEditingController();
    _emailController3 = TextEditingController();
    _nameController3 = TextEditingController();
    _businessController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Refer'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.cardView),
          ),
          //You can make this transparent
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Refer up to 3 businesses',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _inputField(
                                    controller: _nameController1,
                                    hintText: "Add Name",
                                    labelText: "Add Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Name");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _emailController1,
                                    hintText: "Add Email",
                                    labelText: "Add Email",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Email");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _businessController1,
                                    hintText: "Business Name",
                                    labelText: "Business Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error",
                                            "Please fill the Business Name");
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _inputField(
                                    controller: _nameController2,
                                    hintText: "Add Name",
                                    labelText: "Add Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Name");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _emailController2,
                                    hintText: "Add Email",
                                    labelText: "Add Email",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Email");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _businessController2,
                                    hintText: "Business Name",
                                    labelText: "Business Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error",
                                            "Please fill the Business Name");
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _inputField(
                                    controller: _nameController3,
                                    hintText: "Add Name",
                                    labelText: "Add Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Name");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _emailController3,
                                    hintText: "Add Email",
                                    labelText: "Add Email",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error", "Please fill the Email");
                                      }
                                    }),
                                SizedBox(
                                  height: 3,
                                ),
                                _inputField(
                                    controller: _businessController3,
                                    hintText: "Business Name",
                                    labelText: "Business Name",
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        Get.snackbar(
                                            "Error",
                                            "Please fill the Business Name");
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    child: MaterialButton(
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        if(_nameController1.text.isEmpty &&_emailController1.text.isEmpty &&  _businessController1.text.isEmpty &&
                        _nameController2.text.isEmpty &&
                        _emailController2.text.isEmpty &&
                        _businessController2.text.isEmpty &&
                        _nameController3.text.isEmpty &&
                        _emailController3.text.isEmpty &&
                        _businessController3.text.isEmpty ){
                          Get.snackbar("Alert", "Please fill all fields");
                        }
                       else{
                         getSaveData("refer");
                       }
                        },
                      child: Text(
                        'Refer Bizcentive',
                        style: TextStyle(color: Colors.white),
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

  _inputField({TextEditingController controller,
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
  Future<String> getSaveData(String colloectionName) async {
    final firebase = await Firestore.instance.collection(colloectionName);

    try {
      await firebase.getDocuments().then((QuerySnapshot querySnapshot) {

        if  (querySnapshot.documents.isEmpty) {
          FirestoreService().saveReferalRequests(
              _nameController1.text,
              _emailController1.text,
              _businessController1.text,
              _nameController2.text,
              _emailController2.text,
              _businessController2.text,
              _nameController3.text,
              _emailController3.text,
              _businessController3.text);
          _nameController1.text = "";
          _emailController1.text = "";
          _businessController1.text = "";
          _nameController2.text = "";
          _emailController2.text = "";
          _businessController2.text = "";
          _nameController3.text = "";
          _emailController3.text = "";
          _businessController3.text = "";
          Get.snackbar("Alert", "Thanks for helping us");
        }
        else {

          Get.snackbar(
              "Alert", "You already shared this request");
        }
      });


    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
