import 'package:fixurbiz_app/Utility/appImage.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AdviserView extends StatefulWidget {
  @override
  _AdviserViewState createState() => _AdviserViewState();
}

class _AdviserViewState extends State<AdviserView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Advisor'),
          centerTitle: true,
           backgroundColor: Colors.indigo,
          // leading: new IconButton(
          //   icon: new Icon(Icons.arrow_back_ios),
          //   onPressed: () => Get.offNamed(PageIdentifier.selectCategory),
          // ),
        ),

          body: SafeArea(
          child:  Container(
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [

                Expanded(
                  child: SingleChildScrollView(

                    child: Container(

                      child: Column(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(top: 10, left: 10, right: 10,bottom:10 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                  // Center(
                                  //   child: Text(
                                  //     'Welcome to Bizcentive!',
                                  //     style: TextStyle(fontSize: 12, color: Colors.indigo),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Meet Rahul Partha, your personal business advisor!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.indigo[800]),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Image.asset(
                                      AppImage.appIcon_advisor,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Phone: ",
                                      style: TextStyle(fontSize: 14, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: '1800-456-7789 Ext: 2234',
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),

                                  RichText(
                                    text: TextSpan(
                                      text: "Email: ",
                                      style: TextStyle(fontSize: 14, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'r.partha@bizcentive.app',
                                          style:
                                          TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Advisor ID: ",
                                      style: TextStyle(fontSize: 14, color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'INBLR45675',
                                          style: TextStyle(fontSize: 14, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tips to engage',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo[800],
                                      fontSize: 14,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "1.",
                                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                          text:
                                          'Go to your profile section to request an appointment.',
                                          style: TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: "2.",
                                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                          text: 'Prepare an agenda (know what you want).',
                                          style: TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: "3.",
                                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                          text:
                                          'Advisor doesn’t know it all.They are a connection between your business and top consultants. Please wait for assistance as they consult with the team.',
                                          style: TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: "4.",
                                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                          text: 'Be Prepared to make purchase or engagement decisions while speaking to an Advisor.',
                                          style: TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: "5.",
                                      style: TextStyle(fontSize: 14, color: Colors.indigo),
                                      children: [
                                        TextSpan(
                                          text: 'Click on the chat icon on top right corner to chat with them during usual business hours.',
                                          style: TextStyle(fontSize: 14, color: Colors.indigo),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 45,
                  width: 300,
                  child: RaisedButton(
                    color: Colors.indigo[800],
                    child: Text(
                      'Go to the App!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // textColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    onPressed: () {
                      Get.toNamed(PageIdentifier.tabPage);
                    },
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
