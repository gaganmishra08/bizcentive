import 'package:flutter/material.dart';

class PaymentGateWayView extends StatefulWidget {
  @override
  _PaymentGateWayViewState createState() => _PaymentGateWayViewState();
}

class _PaymentGateWayViewState extends State<PaymentGateWayView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Screen"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          child: Text("Payment Will be receive"),
        ),
      ),
    );
  }
}