import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:fixurbiz_app/Views/Card/card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'activity_controller.dart';
class RejectedCard extends StatefulWidget {
  @override
  _RejectedCardState createState() => _RejectedCardState();
}

class _RejectedCardState extends State<RejectedCard> {

  final controller = Get.put(ActivityController());
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  double height, width;
  String _searchText = "";
  var filteredList = List<ActivityModel>().obs;
  @override
  void initState() {
    super.initState();



    filteredList.addAll(controller.activityCard);

  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Rejected Bizcentive Card'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () => Get.offNamed(PageIdentifier.activityView),
        ),

      ),
      body: Container(
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
                                hintText: 'Search',
                                border: InputBorder.none),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Container(
            //         padding: EdgeInsets.only(left: 3),
            //         child: Text(
            //           'Choose from any of our Sales Services ',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //           ),
            //         ))
            //   ],
            // ),
            SizedBox(
              height: 3,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  ActivityModel item = filteredList[index];
                  return _activityCard(
                    item.cardTitle,
                    item.description,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    if (text.isEmpty || text.length == 0) {
      _searchQuery.clear();
      filteredList.clear();
      filteredList.addAll(controller.activityCard);
    } else {
      filteredList.clear();
      controller.activityCard.forEach((element) {
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
  _activityCard(String title, String description) {
    return Container(
      child: Card(
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

                      Get.to(CardView(),arguments:true );
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
