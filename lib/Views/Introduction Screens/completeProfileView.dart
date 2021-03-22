
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileView extends StatelessWidget {
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
              SizedBox(height: Get.height * 0.02),
              Text(
                "Let’s Get Started!",
                style: TextStyle(fontSize: 25, color: Colors.indigo,fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,

              ),
              Flexible(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                children:[ Center(
                  child: Text(
                    "Complete your Profile",
                    style: TextStyle(fontSize: 30, color: Colors.indigo,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                  ],
              ),
              ),

              //SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                FlatButton(onPressed: (){
                Get.toNamed(PageIdentifier.home);
                }, child: Text(
                  'I’ll do it later',style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
                ),
                ),
                Spacer(),
                FlatButton(onPressed: (){
                Get.snackbar("Progress", "We are working on it");
                }, child: Text(
                  'LET’S GET STARTED>>>',style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo
                ),
                ),
                ),
              ],
            )


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