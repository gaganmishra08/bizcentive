import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixurbiz_app/Model/userModel.dart';
import 'package:fixurbiz_app/Utility/appImage.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Utility/google_signin.dart';
import 'package:fixurbiz_app/Utility/localService.dart';
import 'package:fixurbiz_app/Utility/shared_preferences.dart';
import 'package:fixurbiz_app/Views/Dasboard/homeController.dart';
import 'package:fixurbiz_app/Views/Dasboard/homeView.dart';
import 'package:fixurbiz_app/controller/IntroController.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible;
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _emailController;
  TextEditingController _passController;
  @override
  void initState() {
    _passwordVisible = false;
    _emailController = TextEditingController();
    _passController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () => Get.offNamed(PageIdentifier.intro),
        ),
        //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          children: [
            // Align( alignment: Alignment.topLeft,child: FlatButton(onPressed: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios))),
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
            SizedBox(height: Get.height * 0.02),
            Text(
              "Bizcentive offers access to valuable business resources and a global business community",
              style: TextStyle(
                fontSize: 14,
                color: Colors.indigo,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign up and get access to",
              style: TextStyle(fontSize: 14, color: Colors.indigo),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Business Services ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: "at a fraction of the market price ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: "Consulting services ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: "- frameworks & action plans ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.indigo,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    TextSpan(
                        text: "Investors and Mentors ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: "to scale your business",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo,
                                fontWeight: FontWeight.normal),
                          ),
                        ])
                  ]),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                  text: "Personal business advisor ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "who will help you Generate business leads, Tackle Marketing, plan Taxes and manage many more functions of your business",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.normal),
                    )
                  ]),
            ),
            SizedBox(height: 10),
            Center(
                child: Text(
              "Free.Forever.",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 10),
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
                          prefixIcon: Icon(Icons.person),
                          onSubmitted: (value) {
                            if (!value.isNotEmpty) {
                              Get.snackbar("Alert", "Please fill the Email");
                            }
                          }),
                      SizedBox(height: 10),
                      _inputField(
                          isSecure: !_passwordVisible,
                          controller: _passController,
                          hintText: "Enter user password.",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onSuffixIconClick: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
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
                             SignIn().signInWithEmail(
                                _emailController.text, _passController.text).then((value) {

                                  if(value !=null){
                                    print(value);
                                    SharedPreference().addStringToSF(SharedPreference().userID,value.uid );

                                    Get.offNamed(PageIdentifier.tabPage);
                                  }

                            })

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
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Or Continue with",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        icon: Image.asset(AppImage.appIcon_google),
                        iconSize: Get.width * 0.02,
                        onPressed: () async {
                          SignIn().signIn().then((value){
                              if(value != null) {
                                SharedPreference().addStringToSF(SharedPreference().userID,value.uid );
                                Get.toNamed(PageIdentifier.selectCategory);
                              }
                          },
                          );

                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Image.asset(AppImage.appIcon_linkedin),
                        iconSize: Get.width * 0.02,
                        onPressed: () {
                          alertView();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Image.asset(AppImage.appIcon_facebook),
                        iconSize: Get.width * 0.02,
                        onPressed: () {
                          alertView();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Image.asset(AppImage.appIcon_apple),
                        iconSize: Get.width * 0.02,
                        onPressed: () {
                          alertView();
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: FlatButton(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      color: Colors.indigo),
                ),
                onPressed: () {
                  alertView();
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                //elevation: 5.0,
                child: MaterialButton(
                  //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,
                  disabledColor: Colors.indigo.withOpacity(0.3),
                  disabledTextColor: Colors.white54,
                  onPressed: () => {
                    Get.offNamed(PageIdentifier.signUp),
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
            ),
          ],
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

  alertView() {
    return Get.snackbar("Alert", "We are working on it",
        snackPosition: SnackPosition.BOTTOM);
  }

  spaceFromLeft() {
    return SizedBox(
      width: 16,
    );
  }
}
