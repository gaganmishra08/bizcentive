
import 'package:fixurbiz_app/Views/Discount/discount_detailsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../main.dart';
import 'package:get/get.dart';
class DiscountTypeView extends StatefulWidget {
  @override
  _DiscountTypeViewState createState() => _DiscountTypeViewState();
}
enum DiscountType { Product, Service }
class _DiscountTypeViewState extends State<DiscountTypeView> {
  DiscountType _character = DiscountType.Product;
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
              onPressed: () => Get.offNamed(PageIdentifier.discountView),
            ),
        ),
        body: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What are you offering a discount on?',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                 ListTile(
                   title: Text("Product",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                   leading: Radio<DiscountType>(
                     value: DiscountType.Product,
                     groupValue: _character,
                     onChanged: (DiscountType value){
                       setState(() {
                         _character = value;
                       });
                     },
                   ),
                 ),
                  ListTile(
                    title: Text("Service",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                    leading: Radio<DiscountType>(
                      value: DiscountType.Service,
                      groupValue: _character,
                      onChanged: (DiscountType value){
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed:(){Get.to(DiscountDetailView(),arguments:[_character]);},


                        child: Text('Proceed',style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        height: 50.0,
                        color: Colors.indigo,
                        minWidth: MediaQuery.of(context).size.width/2,
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
