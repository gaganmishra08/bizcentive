import 'package:fixurbiz_app/Views/Dasboard/homeController.dart';
import 'package:fixurbiz_app/controller/IntroController.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class IntroductionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:
      Scaffold(

        body: SafeArea(
          child: Container(
            //margin: EdgeInsets.only(top: Get.height * 0.02),
            padding:
                EdgeInsets.only(top: Get.height * 0.02, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(height: Get.height * 0.04),
                RichText(
                  text: TextSpan(
                    text: '[biz-',
                    style: TextStyle(fontSize: 40, color: Colors.indigo),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'cen',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,

                              color: Colors.indigo)),
                      TextSpan(
                        text: '-tive] ',
                        style: TextStyle(fontSize: 40, color: Colors.indigo),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Text(
                  "noun",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: Get.height * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "a business incentive",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "business incentives for everbody. Designed to help Individuals, Solopreneurs, Entrepreneurs and Small & Medium business owners, keep their dream business going, from strength to strength",
                        style: TextStyle(fontSize: 18, color: Colors.indigo,),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Use in a sentence",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Text(
                          "Gosh! I wish the government gave me bizcentives to help me get through these tough COVID times!",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 50,
                      width: 150,
                      child: RaisedButton(
                        onPressed: () {
                          Get.toNamed(PageIdentifier.login);
                        },
                        child: Text(
                          "Get it!",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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

  spaceFromLeft() {
    return SizedBox(
      width: 16,
    );
  }
}
