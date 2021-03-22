import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_indicator/page_indicator.dart';

class PageControllerView extends StatefulWidget {
  @override
  _PageControllerViewState createState() => _PageControllerViewState();
}

class _PageControllerViewState extends State<PageControllerView> {
  PageController controller;
  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                      color: Colors.indigo[600]),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Text(
                "Here’s how it works",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Container(
                child: Expanded(
                  child: PageIndicatorContainer(
                    key: key,
                    child: PageView(
                      onPageChanged: (page) {
                        if (page == 3) {
                          Get.toNamed(PageIdentifier.login);
                        }
                      },
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Step01",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                  color: Colors.indigo),
                            ),

                            SizedBox(height: 10),

                            //Expanded(child:

                            Text(
                              "You will receive an unlimited number of bizcentive just for signing up.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23,
                                  color: Colors.indigo),
                            ),
                            SizedBox(height: 10),
                            // ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Step02",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                  color: Colors.indigo),
                            ),

                            SizedBox(height: 10),
                            Text(
                              "Complete profile and offer bizcentives to unlock many premium features.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23,
                                  color: Colors.indigo),
                            ),

                            SizedBox(
                              height: Get.height*0.02,
                            ),
                            Text(
                              "Remember. The more you give. The more you get.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.indigo),
                            )
                            // ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Step03",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                  color: Colors.indigo),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Offer and honor as many bizcentives as you can to enhance your Givescore™",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23,
                                  color: Colors.indigo),
                            ),
                            SizedBox(
                              height: Get.height*0.02,
                            ),
                            Text(
                              "Givescore™ is a score that indicates how friendly, giving and valuable a company’s offerings are ",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.indigo),
                            )
                            // ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Step04",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 40,
                                  color: Colors.indigo),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Assess your Business and get your Achievescore™",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 23,
                                  color: Colors.indigo),
                            ),
                            SizedBox(
                              height: Get.height*0.02,
                            ),
                            Text(
                              "Achievescore™ is a score that indicates the readiness of your business to achieve success.",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.indigo),
                            )
                            // ),
                          ],
                        ),
                      ],
                      controller: controller,
                      reverse: false,
                    ),
                    align: IndicatorAlign.bottom,
                    length: 4,
                    indicatorSpace: 10.0,
                    indicatorSelectorColor: Colors.indigo,
                    indicatorColor: Colors.grey.shade300,
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
      width: 10,
    );
  }
}
