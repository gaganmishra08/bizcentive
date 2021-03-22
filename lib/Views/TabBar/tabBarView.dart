


import 'package:fixurbiz_app/Utility/appImage.dart';
import 'package:fixurbiz_app/Views/Introduction%20Screens/IntroductionView.dart';
import 'package:fixurbiz_app/Views/Chat/chatView.dart';
import 'package:fixurbiz_app/Views/Dasboard/homeView.dart';
import 'package:fixurbiz_app/Views/Notification/notificationView.dart';
import 'package:fixurbiz_app/Views/Payments/paymentGatewayView.dart';
import 'package:fixurbiz_app/Views/Profile/profileView.dart';
import 'package:fixurbiz_app/bindings/homebinding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<Widget> _pageList;
  String coins = "4678990 Coins";

  @override
  void initState() {
    _page = 0;

    _pageList = [
      HomeView(),
      NotificationView(),
      ChatView(),
      ProfileView(),
      PaymentGateWayView(),
    ];
    super.initState();
  }
  void _upDate(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width *0.23,
          height: MediaQuery.of(context).size.width *0.23,
          child: FloatingActionButton(
            shape: CircleBorder(),

            onPressed: () {
              Get.snackbar("Alert", 'We are working on it',snackPosition:SnackPosition.BOTTOM );
              _upDate();
            },
            tooltip: 'Increment',
            child: Text(coins,style: TextStyle(fontSize:14 ),textAlign:TextAlign.center,),
            elevation: 1.0,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.home), onPressed: () {_page = 0;_upDate();}),
                IconButton(icon: Icon(Icons.notification_important), onPressed: () {_page = 1;_upDate();}),
                SizedBox(width:  MediaQuery.of(context).size.width *0.23), // The dummy child
                IconButton(icon: Icon(Icons.chat), onPressed: () { _page = 2;_upDate();}),
                IconButton(icon: Icon(Icons.person), onPressed: () {_page = 3;_upDate();}),

              ],
            ),
          ),

        ),

        body: _pageList[_page]);
  }
}
