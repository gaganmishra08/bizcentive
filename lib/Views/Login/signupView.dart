import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Utility/google_signin.dart';
import 'package:fixurbiz_app/Utility/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _emailController;
  TextEditingController _passController;

  TextEditingController _cpassController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _cpassController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.login),
          ),
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "bizcentive",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.indigo),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Card(
                    elevation: 8.0,
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
                              prefixIcon: Icon(Icons.email),
                              onSubmitted: (value) {
                                if (!value.isNotEmpty) {
                                  Get.snackbar(
                                      "Alert", "Please fill the Email");
                                }
                              }),
                          SizedBox(height: 10),
                          _inputField(
                              isSecure: true,
                              controller: _passController,
                              hintText: "Enter user password.",
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              onSubmitted: (value) {
                                if (!value.isNotEmpty) {
                                  Get.snackbar(
                                      "Alert", "Please fill the password");
                                }
                              }),
                          SizedBox(height: 10),
                          _inputField(
                              isSecure: true,
                              controller: _cpassController,
                              hintText: "Confirm password.",
                              labelText: "Confirm Password",
                              prefixIcon: Icon(Icons.lock),
                              onSubmitted: (value) {
                                if (!value.isNotEmpty) {
                                  Get.snackbar(
                                      "Alert", "Please fill the password");
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
                              onPressed: () =>
                              {
                                SignIn()
                                    .signUpWithEmail(
                                    _emailController.text, _passController.text)
                                    .then((value) {

                                      if(value != null) {
                                        SharedPreference().addStringToSF(SharedPreference().userID,value.uid );

                                        Get.offNamed(
                                            PageIdentifier.selectCategory);
                                      }

                              }
                                ),

                              },
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              height: 50.0,
                              color: Colors.indigo,
                              child: Text(
                                "Sign Up",
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
}
