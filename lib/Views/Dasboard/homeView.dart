import 'package:fixurbiz_app/Utility/shared_preferences.dart';
import 'package:fixurbiz_app/Views/Card/bizcentiveCardView.dart';
import 'package:fixurbiz_app/Views/Card/card_view.dart';
import 'package:fixurbiz_app/Views/Dasboard/homeController.dart';
import 'package:fixurbiz_app/Views/Govt/grant.dart';
import 'package:fixurbiz_app/Views/Sales/sales_view.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utility/appImage.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double height = Get.height;
  double width = Get.width;
  RxInt _attemptCount = 3.obs;
  String balance = ' Bizcentive Coin Balance: 250';
  final controller = Get.put(HomeController());
  final govt_controller = Get.put(GrantState());
  RxInt count = 1.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(controller.showHideToggle);
    counter();
  }
counter() async{
  final prefs = await SharedPreferences.getInstance();
   count.value = prefs.getInt('counter') ?? 0;

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx ( () => Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "bizcentive",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.indigo),
                      ),
                      controller.showHideToggle.value
                          ? Container()
                          : Row(
                              children: [
                                Obx(
                                  () =>

                                      Text(
                                    controller.isToggled.value == true
                                        ? "Community"
                                        : "Business",
                                    style: TextStyle(fontSize: 18),
                                  ),

                                ),
                                SizedBox(width: 10),
                                FlutterSwitch(
                                  height: 20.0,
                                  width: 40.0,
                                  padding: 4.0,
                                  toggleSize: 15.0,
                                  borderRadius: 10.0,
                                  activeColor: Colors.indigo,
                                  inactiveColor: Colors.indigo,
                                  value: controller.isToggled.value,
                                  onToggle: (value) {
                                    controller.isToggled.toggle();
                                  },
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  height: 100,
                  child: Obx(
                    () => ListView.builder(
                      //shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.isToggled.value
                          ? controller.communityList.length
                          : controller.businessList.length,
                      itemBuilder: (context, index) {
                        Menu item = controller.isToggled.value
                            ? controller.communityList[index]
                            : controller.businessList[index];
                        return _textIconButton(
                          item.imageName,
                          item.title,
                          iconSize: Size(60, 60),
                          onTap: () {
                            if (controller.isToggled.value == true) {

                              if (index == 0) {
                                Get.toNamed(PageIdentifier.discountView);
                              } else {
                                Get.snackbar("Progress", "We are working on it");
                              }
                            } else {
                              if(index == 0){
                                Get.toNamed(PageIdentifier.assisment);
                              }
                              else if (index == 1) {
                                Get.to(SalesView(),arguments:["Sales"] );

                              }else if (index ==2){
                                Get.to(SalesView(),arguments:["Marketing"] );

                              }
                              else if (index ==3){
                                Get.to(SalesView(),arguments:["Legal"] );
                              }
                              else if(index ==4){
                                Get.to(SalesView(),arguments:["Tax & CPA"] );
                              }
                              else if (index == 5){
                                Get.to(SalesView(),arguments:["Tech"] );
                              }
                              else if (index == 6){
                                Get.to(SalesView(),arguments:["HR"] );
                              }
                              else if (index == 7){
                                Get.to(Grant(),arguments:["Govt.Grants"] );
                              }
                              else if (index == 8){
                                Get.to(Grant(),arguments:["Investors"] );

                              }
                              else if (index == 9){
                                Get.to(Grant(),arguments:["Govt.Jobs"] );


                              }
                              else if (index==10){
                                Get.toNamed(PageIdentifier.activityView);
                              }
                              else {
                                Get.snackbar(
                                    "Progress", "We are working on it");
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text(
                    " $_attemptCount Attempts left!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: _centerView(),
                ),
              ),
            ]),
    )
      ),
    );
  }

  Widget _centerView() {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    icon: Image.asset('assets/images/reload.png'),
                    iconSize: 100,
                    onPressed: () {
                      setCount();
                    },
                  ),
                ),
                Text("Click for a new bizcentive!"),
              ],
            );

  }
setCount()async{
  final prefs =  await SharedPreferences.getInstance();


  if(count.value <= 3){
  
    _attemptCount.value =   _attemptCount.value-count.value;
    count.value++;
     prefs.setInt('counter', count.value);
    Get.toNamed(PageIdentifier.cardView);
  }


   else{
     Get.snackbar("Alert", "You have exceed the limit");
     alert(context);
  }
}
  _topButton(IconData icon,
      {Color iconColor = Colors.grey, double size = 25, Function onTap}) {
    return IconButton(
        icon: Icon(icon, color: iconColor, size: size), onPressed: onTap);
  }

  /// _textIconButton:-
  /// @required imageName [String], title[String]
  /// @OPTIONAL iconColor[Color], iconSize[Size],iconFit[BoxFit],fontWeight[FontWeight],fontSize[double],textColor[Color],onTap[Function]
  _textIconButton(String imageName, String title,
      {Color iconColor,
      Size iconSize = Size.zero,
      BoxFit iconFit = BoxFit.cover,
      FontWeight fontWeight = FontWeight.normal,
      double fontSize = 13,
      Color textColor = Colors.black,
      Function onTap}) {
    return SizedBox(
      //width: 50,
      //height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Image.asset(
                imageName,
                width: iconSize.width,
                height: iconSize.height,
                color: iconColor,
                fit: iconFit,
              ),
              Text(
                title,
                style: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: textColor),
              )
            ],
          ),
        ),
      ),
    );
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
