import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Utility/alert_view.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'cardController.dart';

class CardView extends StatefulWidget {
  @override
  CardViewState createState() => CardViewState();
}

class CardViewState extends State<CardView> {
  final controller1 = Get.put(cardController());
  final controller = Get.put(AlertView());
  String dateFormate;

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
            onPressed: () {
              isfromActivity
                  ? Get.toNamed(PageIdentifier.activityView)
                  : Get.toNamed(PageIdentifier.tabPage);

            },
          ),
        ),
        body: Obx(
          () => controller1.cardItems.isEmpty
              ? Center(
                  child: Text("No card is available now"),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 0),
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
                                            icon: Image.asset(
                                                'assets/images/reload.png'),
                                            iconSize: 80,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Type:${controller1.cardItems[0].type}',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          Text(
                                              'Subtype: ${controller1.cardItems[0].subType}',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          Text(
                                              'Source: ${controller1.cardItems[0].source}'),
                                          Text(
                                              'Location: ${controller1.cardItems[0].location}'),
                                        ],
                                      )
                                    ],
                                  ),
                                  Text('${controller1.cardItems[0].title}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${controller1.cardItems[0].description}',
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
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10.0,
                                              top: 5,
                                              bottom: 5,
                                              right: 10.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey)),
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
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              top: 5,
                                              bottom: 5,
                                              right: 8.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Column(
                                            children: [
                                              Text(
                                                "\$${controller1.cardItems[0].regularPrice}",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Divider(
                                                height: 3,
                                              ),
                                              Text(
                                                "\$${controller1.cardItems[0].discount}",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Divider(
                                                height: 3,
                                              ),
                                              Text(
                                                "\$${controller1.cardItems[0].reducedPrice}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Divider(
                                                height: 3,
                                              ),
                                              Text(
                                                '${DateFormat("dd-MM-yyyy").format(DateTime.parse(controller1.cardItems[0].valid))}',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Bizcentive ID:",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller1.cardItems[0].bezcentiveId}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Redemption ID: ",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller1.cardItems[0].redemptionId}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller1.cardItems[0].phone}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller1.cardItems[0].email}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${controller1.cardItems[0].company}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                            onPressed: () {
                                              controller1
                                                  .getCardStatus("saveCards")
                                                  .then((value) {
                                                controller1.isSavedCard.isTrue
                                                    ? Get.snackbar("Alert",
                                                        "Already Saved")
                                                    : FirestoreService()
                                                        .savedCard(
                                                            controller1
                                                                .cardItems[0],
                                                            "saveCards",
                                                            true,
                                                            false,
                                                            false);
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            icon:
                                                Icon(FontAwesomeIcons.shareAlt),
                                            onPressed: () {
                                              Get.toNamed(PageIdentifier.refer);
                                            }),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            icon: Icon(
                                                FontAwesomeIcons.timesCircle),
                                            color: Colors.red,
                                            onPressed: () {
                                              controller1
                                                  .getCardStatus(
                                                      "rejectedCards")
                                                  .then((value) {
                                                controller1
                                                        .isRejectedCard.isTrue
                                                    ? Get.snackbar("Alert",
                                                        "Already Rejected")
                                                    : FirestoreService()
                                                        .savedCard(
                                                            controller1
                                                                .cardItems[0],
                                                            "rejectedCards",
                                                            false,
                                                            true,
                                                            false);
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            icon: Icon(
                                                FontAwesomeIcons.checkCircle),
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
          onPressed: () {
            controller1.getCardStatus("acceptedCards").then((value) {
              controller1.isAcceptedCard.isTrue
                  ? Get.snackbar("Alert", "Already accepted")
                  : FirestoreService().savedCard(controller1.cardItems[0],
                      "acceptedCards", false, false, true);
            });
          },
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
