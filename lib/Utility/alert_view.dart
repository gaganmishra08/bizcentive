import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      height: MediaQuery.of(context).size.height/3,
      color: Colors.redAccent,
      child: Column(
        children: [
          Center(
            child: AlertDialog(
              title:Text('Bizcentive Cost'),
              content: Text('This Bizcentive Costs 25 Coins'),
              actions: [
                FlatButton(onPressed: (){}, child: Text('Cancel'),color: Colors.redAccent,),
                FlatButton(onPressed: (){}, child: Text('Ok'),color: Colors.green,),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
