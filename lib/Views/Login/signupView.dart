import 'package:fixurbiz_app/Utility/appImage.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Utility/google_signin.dart';
import 'package:fixurbiz_app/Utility/shared_preferences.dart';
import 'package:fixurbiz_app/Views/Category/selectCategoryView.dart';
import 'package:flutter/material.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}
enum SignupType {Individual,Business,Other }
class _SignUpViewState extends State<SignUpView> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _emailController;
  TextEditingController _passController;
  SignupType _character = SignupType.Individual;
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
            onPressed: () => Get.offNamed(PageIdentifier.intro),
          ),
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
               // SizedBox(height: 10,),
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
                Text("Business Incentives for Individuals and Businesses",style: TextStyle(color: Colors.indigo),),
                SizedBox(height: 10,),

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Choose',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                          ListTile(
                            title: Text("Individual (Get amazing deals)",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal)),
                            leading: Radio<SignupType>(
                              value: SignupType.Individual,
                              groupValue: _character,
                              onChanged: (SignupType value){
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Business Owner (Grow your business)",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal)),
                            leading: Radio<SignupType>(
                              value: SignupType.Business,
                              groupValue: _character,
                              onChanged: (SignupType value){
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Other (Become a Partner)",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal)),
                            leading: Radio<SignupType>(
                              value: SignupType.Other,
                              groupValue: _character,
                              onChanged: (SignupType value){
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
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
                         /* SizedBox(height: 10),
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
                              }),*/
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
                                if(_emailController.text.isEmpty || _passController.text.isEmpty) {
                                  Get.snackbar("Error", "Please fill correct Email or Password"),
                                }else
                              {
                              SignIn()
                                  .signUpWithEmail(
                              _emailController.text, _passController.text)
                                  .then((value) {

                              if(value != null) {
                              SharedPreference().addStringToSF(SharedPreference().userID,value.uid );
                              Get.to(SelectCategory(),arguments:[_character]);

                              }

                              }
                              ),
                              },

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
                          SizedBox(height: 10),
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
                                            Get.to(SelectCategory(),arguments:[_character]);
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


                          Material(

                            //elevation: 5.0,
                            child: MaterialButton(
                              //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,

                              onPressed: () =>
                              {
                                Get.offNamed(PageIdentifier.login),
                              },
                              minWidth: double.infinity,


                              child: Text(
                                "Already have an account? Login",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          )


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
  alertView() {
    return Get.snackbar("Alert", "We are working on it",
        snackPosition: SnackPosition.BOTTOM);
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
