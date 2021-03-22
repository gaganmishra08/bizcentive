import 'package:fixurbiz_app/Utility/alert_view.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class CardView extends StatefulWidget {
  @override
  CardViewState createState() => CardViewState();
}

class CardViewState extends State<CardView> {
  final controller = Get.put(AlertView());
  bool _isAlert = false;
  var isfromActivity = Get.arguments ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bizcentive Card'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () { isfromActivity ? Get.toNamed(PageIdentifier.activityView):Get.offNamed(PageIdentifier.tabPage);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0),
              child: Column(
                children: [
                  Card(
                    //elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1),
                      //borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    icon:
                                        Image.asset('assets/images/reload.png'),
                                    iconSize: 80,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Type: Sales',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                  Text('Subtype: Service',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal)),
                                  Text('Source: Own'),
                                  Text('Location: Sunnyvale,CA,USA'),
                                ],
                              )
                            ],
                          ),
                          Text(
                              'Get 40% off on planning your Sales Process.Get an Expert to build a result oriented Sales process',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "This premium Sale process package includes the best Sales consultants.They'll look at your business,They will understand your offering the build a compelling sales process for best results.",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      top: 5,
                                      bottom: 5,
                                      right: 10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Regular Price',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        'Discount',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        'Reduced Price',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        'Valid for',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 8.0, top: 5, bottom: 5, right: 8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "\$2400",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        "\$960",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        "\$1400",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Divider(
                                        height: 3,
                                      ),
                                      Text(
                                        "121 days",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Divider(height: 8,),

                          // Divider(
                          //   height: 0,
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Bizcentive ID: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '***********',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              // Column(
                              //   children: [
                              //     IconButton(
                              //         icon: Icon(
                              //           FontAwesomeIcons.flag,
                              //           size: 20,
                              //         ),
                              //         onPressed: () {}),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Redemption ID: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '***********',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Phone: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: '+1-416-616-2546',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Email: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'admin@bizcentive.com',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Company: ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Bizcentive Inc.',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: IconButton(
                                    icon: Icon(FontAwesomeIcons.file),
                                    color: Colors.black,
                                    onPressed: () {
                                      Get.toNamed(PageIdentifier.term);
                                    }),
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(Icons.bookmark),
                                    onPressed: () {}),
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(FontAwesomeIcons.shareAlt),
                                    onPressed: () {
                                      Get.toNamed(PageIdentifier.refer);
                                    }),
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(FontAwesomeIcons.timesCircle),
                                    color: Colors.red,
                                    onPressed: () {
                                      Get.offNamed(PageIdentifier.tabPage);
                                    }),
                              ),
                              Expanded(
                                child: IconButton(
                                    icon: Icon(FontAwesomeIcons.checkCircle),
                                    color: Colors.orange,
                                    onPressed: () {
                                      alert(context);
                                    }),
                              ),
                            ],
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
      ),
    );
  }

  _updateView() {
    setState(() {});
  }

  alert(BuildContext con) {
    AlertDialog alt = AlertDialog(
      title: Text('Bizcentive Cost'),
      content: Text('This Bizcentive Costs 25 Coins'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(con).pop();
          },
          child: Text('Cancel'),
          color: Colors.redAccent,
        ),
        FlatButton(
          onPressed: () {},
          child: Text('Ok'),
          color: Colors.green,
        ),
      ],
    );
    showDialog(
        context: con,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alt;
        });
  }
}
