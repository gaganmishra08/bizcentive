import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:fixurbiz_app/Views/Activity/accept_card.dart';
import 'package:fixurbiz_app/Views/Activity/activity_controller.dart';
import 'package:fixurbiz_app/Views/Activity/reject_card.dart';
import 'package:fixurbiz_app/Views/Activity/save_card.dart';
import 'package:fixurbiz_app/Views/Card/card_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ActivityView extends StatefulWidget {
  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView>
    with TickerProviderStateMixin {
  TabController _tabController;
  double height, width;

  final controller = Get.put(ActivityController());
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();

  String _searchText = "";
  var filteredList = List<ActivityModel>().obs;
  var optionslist = List<Activity>().obs;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    filteredList.addAll(controller.activityCard);
    optionslist.addAll(controller.options);
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
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Activity'),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () => Get.offNamed(PageIdentifier.tabPage),
            ),
            bottom: PreferredSize(
                preferredSize: Size(200, 60),
                child: TabBar(

                  isScrollable: true,
                  tabs: <Widget>[

                    Tab(
                      icon: Icon(
                        Icons.import_contacts,
                        size: 0,
                      ),
                      text: "Bizcentives",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.import_contacts,
                        size: 0,
                      ),
                      text: "Investors",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.import_contacts,
                        size: 0,
                      ),
                      text: "Govt. Jobs",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.import_contacts,
                        size: 0,
                      ),
                      text: "Govt. Grants",
                    ),
                    Tab(
                      icon: Icon(
                        Icons.import_contacts,
                        size: 0,
                      ),
                      text: "Offers",
                    ),

                  ],
                )
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: optionslist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Activity item = optionslist[index];
                    return _optionCard(
                        item.title,
                        index
                    );
                  },
                ),

              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: optionslist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Activity item = optionslist[index];
                    return _optionCard(
                      item.title,
index
                    );
                  },
                ),

              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: optionslist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Activity item = optionslist[index];
                    return _optionCard(
                      item.title,
                        index
                    );
                  },
                ),

              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: optionslist.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Activity item = optionslist[index];
                    return _optionCard(
                      item.title,
                      index

                    );
                  },
                ),

              ),
              Container(
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
                              Get.toNamed(PageIdentifier.discountType);
                            },
                              child: Text('Add a Discount Offering'),
                              textColor: Colors.white,
                              color: Colors.indigo,),),),
                      ),
                    ),

                  ],
                ),
              ),
/*
              Container(
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
              Container(
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
              Container(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }


  _optionCard(String title, int index) {
    return Container(
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.blue),
        ),
        child: Container(
            child: Column(
                children: [
            MaterialButton(
            //enabled: _emailController.text.isNotEmpty && _passController.text.isNotEmpty ,
            disabledColor: Colors.indigo.withOpacity(0.3),
            disabledTextColor: Colors.white54,
            onPressed: () => {
            if (index == 0){

            Get.to(SavedCard(),arguments:["saveCards"]),
            } else
            if (index == 1){
            Get.to(AcceptedCard(),arguments:["acceptedCards"]),


        }
        else{
            Get.to(RejectedCard(),arguments:["rejectedCards"]),
      }
      },
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        height: 100,
        color: Colors.indigo,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }

}