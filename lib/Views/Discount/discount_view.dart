import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import 'package:get/get.dart';

class DiscountView extends StatefulWidget {
  @override
  _DiscountViewState createState() => _DiscountViewState();
}

class _DiscountViewState extends State<DiscountView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Discount'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.tabPage),
          ),

        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                Text('To Access the Bizcentive Community Discount Feature, Your business must First add a Product or Service to the Discount',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo),),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Center(
                    child: Container(height: 50,width: MediaQuery.of(context).size.width/0.20,
                      child: FlatButton(onPressed: () {
                        Get.toNamed(PageIdentifier.discountDetailView);
                      },
                        child: Text('Add a Discount Offering'),
                        textColor: Colors.white,
                        color: Colors.indigo,),),),
              ),
            ),

          ],
        ),
      ),
    ) ,)
    ,
    );
  }
}
