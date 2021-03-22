import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(

          //margin: EdgeInsets.only(top: Get.height * 0.02),
          padding: EdgeInsets.only(top: Get.height * 0.02, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "bizcentives",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.indigo),
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Text(
                "Get access to 6 Bizcentives",
                style: TextStyle(fontSize: 25, color: Colors.indigo,fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,

              ),

              SizedBox(height: Get.height * 0.04),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "> Great Discounts",
                    style: TextStyle(fontSize: 18, color: Colors.indigo,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "> Shared Office Resources",
                    style: TextStyle(fontSize: 18, color: Colors.indigo,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "> Network of business owners",
                    style: TextStyle(fontSize: 18, color: Colors.indigo,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "> Professional Consulting",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "> Business Services",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                    ),

                  SizedBox(height: 30),
                  Text(
                    "> Exclusive SME Investors",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                    ),

                ],
              ),

              Container(
                child: Expanded(

                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 50,
                      child: RaisedButton(
                          onPressed: () {
                            Get.toNamed(PageIdentifier.pageController);
                          },
                          child: Text(
                            "Get Started",
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
              ),
            ],
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