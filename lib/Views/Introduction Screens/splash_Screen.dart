import 'dart:async';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Get.toNamed(PageIdentifier.intro));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "bizcentive",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}