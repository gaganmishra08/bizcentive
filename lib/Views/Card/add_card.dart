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
  TextEditingController _emailController;
  TextEditingController _passController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
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
                Card(
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
                            controller: _emailController,
                            hintText: "Enter user email.",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.person),
                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the Email");
                              }
                            }),
                        SizedBox(height: 10),
                        _inputField(

                            controller: _passController,
                            hintText: "Enter user password.",
                            labelText: "Password",

                            onSubmitted: (value) {
                              if (!value.isNotEmpty) {
                                Get.snackbar("Alert", "Please fill the password");
                              }
                            }),
                        SizedBox(height: 10),
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          //elevation: 5.0,
                          child: MaterialButton(
                            //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,
                            disabledColor: Colors.indigo.withOpacity(0.3),
                            disabledTextColor: Colors.white54,
                            onPressed: () => {

                            },
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            height: 50.0,
                            color: Colors.indigo,
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
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
