import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:fixurbiz_app/Views/Sales/sales_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../main.dart';

class SalesView extends StatefulWidget {
  @override
  SalesViewState createState() => SalesViewState();
}

class SalesViewState extends State<SalesView> {
  final controller = Get.put(SalesController());
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  bool Is_FromSale = false;
  String _searchText = "";
  var filteredList = List<SalesModel>().obs;

  @override
  void initState() {
    super.initState();
    filteredList.addAll(controller.salesCard);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Is_FromSale? null : AppBar(
          centerTitle: true,
          title: Text('Sales'),
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
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Card(
                            child: new ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextField(
                            controller: _searchQuery,
                            decoration: new InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.cancel),
                            onPressed: () {
                              onSearchTextChanged('');
                            },
                          ),
                        )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.slidersH),
                      ),
                    ),

                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Container(padding:EdgeInsets.only(left:3 ),child: Text('Choose from any of our Sales Services ',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,),))
                  ],
                ),
                SizedBox(height: 3,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      SalesModel item = filteredList[index];
                      return _salesCard(
                        item.cardTitle,
                        item.description,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    if (text.isEmpty || text.length == 0) {
      _searchQuery.clear();
      filteredList.clear();
      filteredList.addAll(controller.salesCard);
    } else {
      filteredList.clear();
      controller.salesCard.forEach((element) {
        print(text);
        print(element.cardTitle);
        if (element.cardTitle.toLowerCase().contains(text.toLowerCase())) {
          filteredList.add(element);
          print(filteredList.length.toString());
        }
      });
    }
    setState(() {});
  }

  _salesCard(String title, String description) {
    return Container(
     child:Card(
       elevation: 8.0,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
         side: BorderSide(color: Colors.blue),
       ),
       child: Container(
         padding: EdgeInsets.all(8),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               title,
               style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Colors.black),
             ),
             SizedBox(
               height: 5,
             ),
             Text(
               description,
               style: TextStyle(fontSize: 14),
             ),
             Align(
                 alignment: Alignment.bottomRight,
                 child: RaisedButton(
                   onPressed: () {
                     Get.toNamed(PageIdentifier.salesDetailView);
                   },
                   padding: EdgeInsets.all(0),
                   color: Colors.indigo,
                   textColor: Colors.white,
                   child: Text('More'),
                 ))
           ],
         ),
       ),
     ),

    );
  }
}
