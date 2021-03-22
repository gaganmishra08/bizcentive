import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'package:get/get.dart';
class DiscountDetailView extends StatefulWidget {
  @override
  _DiscountDetailViewState createState() => _DiscountDetailViewState();
}

class _DiscountDetailViewState extends State<DiscountDetailView> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _discountOn1;
  TextEditingController _titleProduct1;
  TextEditingController _discountOn2;
  TextEditingController _titleProduct2;
  TextEditingController _discountOn3;
  TextEditingController _titleProduct3;


  @override
  void initState() {

    _discountOn1 = TextEditingController();
    _titleProduct1 = TextEditingController();
    _discountOn2 = TextEditingController();
    _titleProduct2 = TextEditingController();
    _discountOn3 = TextEditingController();
    _titleProduct3 = TextEditingController();




    super.initState();
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
            height: MediaQuery.of(context).size.height/0.20,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(

                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _inputField(
                            controller: _discountOn1,
                            hintText: "What are you Offering a Discount on?",
                            labelText: "What are you Offering a Discount on?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the Email");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _titleProduct1,
                            hintText: "What’s the Title of the discounted Product?",
                            labelText: "What’s the Title of the discounted Product?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the field");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _discountOn2,
                            hintText: "What’s the Title of the discounted Product?",
                            labelText: "What’s the Title of the discounted Product?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the field");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _titleProduct2,
                            hintText: "What’s the Title of the discounted Product?",
                            labelText: "What’s the Title of the discounted Product?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the field");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _discountOn3,
                            hintText: "What’s the Title of the discounted Product?",
                            labelText: "What’s the Title of the discounted Product?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the field");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _titleProduct3,
                            hintText: "What’s the Title of the discounted Product?",
                            labelText: "What’s the Title of the discounted Product?",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the field");
                              }
                            }),


                      ],
                    ),
                  ),
                ),
               
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      //elevation: 5.0,
                      child: MaterialButton(
                        //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,
                        disabledColor: Colors.indigo.withOpacity(0.3),
                        disabledTextColor: Colors.white54,
                        onPressed: () => {
                          //alertView(),
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.blue),
        ),

        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13),
      ),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}
