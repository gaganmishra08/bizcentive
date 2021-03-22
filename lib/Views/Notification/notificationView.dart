import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        automaticallyImplyLeading: false,

      ),
      body: SafeArea(
        child: Container(
          child: Text("Notification Will be receive"),
        ),
      ),
    );
  }
}
