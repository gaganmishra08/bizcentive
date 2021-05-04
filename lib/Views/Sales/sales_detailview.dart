import 'package:fixurbiz_app/Model/sales_Model.dart';
import 'package:fixurbiz_app/Views/Sales/sales_controller.dart';
import 'package:fixurbiz_app/Views/Sales/sales_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SalesDetailView extends StatefulWidget {
  @override
  _SalesDetailViewState createState() => _SalesDetailViewState();
}

class _SalesDetailViewState extends State<SalesDetailView>
    with TickerProviderStateMixin {
  TabController _tabController;
  double height, width;

  final controller = Get.put(SalesController());
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  bool _IsSearching;
  String _searchText = "";
  var filteredList = List<SalesModel>().obs;
  List  textStr = Get.arguments;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    _IsSearching = false;
    filteredList.addAll(controller.salesCard);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lead Generation'),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () => Get.to(SalesView(),arguments:[textStr.first]),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.import_contacts,
                    size: 0,
                  ),
                  text: "General Information",
                ),
                Tab(
                  icon: Icon(
                    Icons.import_contacts,
                    size: 0,
                  ),
                  text: "Basic Plans",
                ),
                Tab(
                  icon: Icon(
                    Icons.import_contacts,
                    size: 0,
                  ),
                  text: "Advance Plans",
                ),
                Tab(
                  icon: Icon(
                    Icons.import_contacts,
                    size: 0,
                  ),
                  text: "Premium Plans",
                ),
                Tab(
                  icon: Icon(
                    Icons.import_contacts,
                    size: 0,
                  ),
                  text: "Resources",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Highlights of this plan',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: ".   ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        "Our team of experts will generate curated, qualified leads for your business.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: ".   ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        "and/or close deals with your clients. Please click on this card for more details.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: ".   ",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        "Our team of experts will generate curated, qualified leads for your business.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Terms of Engagement:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to help you engage and/or close deals with your clients. Please click on this card for more details.'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Requirements from the Client that’s you',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                'Our team of experts will generate curated, qualified leads for your business. Depending on the nature of your business, we will generate leads to.  '),
                          ],
                        ),
                      ),
                    )),
                    Center(
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "Contact a Consultant",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),/*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$399",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Billed Monthly",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(

                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Subscribe',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 10,
                              ),*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Highlights of this plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                          "Our team of experts will generate."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("curated, qualified."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("leads for your business.."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Depending on the nature of your business,',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("we will generate lead"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("s to help you engage."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                          Expanded(child:Text(
                                    'And/or close deals with your clients.',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" Please click on"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" this card for more details."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      '"\$399"',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(

                      child: Container(
                       
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('Looking for Enterprise solutions?'),
                            MaterialButton(
                              height: 50,
                              onPressed: () {},
                              child: Text(
                                "Contact a Consultant",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),/*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$399",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Billed Monthly",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(

                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Subscribe',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 10,
                              ),*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Highlights of this plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                          "Our team of experts will generate."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("curated, qualified."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("leads for your business.."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Depending on the nature of your business,',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("we will generate lead"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("s to help you engage."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Expanded(child:Text(
                                    'And/or close deals with your clients.',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" Please click on"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" this card for more details."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      '"\$399"',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(

                      child: Container(

                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('Looking for Enterprise solutions?'),
                            MaterialButton(
                              height: 50,
                              onPressed: () {},
                              child: Text(
                                "Contact a Consultant",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              /*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$399",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Billed Monthly",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(

                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Subscribe',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 10,
                              ),*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Highlights of this plan',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                          "Our team of experts will generate."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("curated, qualified."),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("leads for your business.."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Depending on the nature of your business,',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("we will generate lead"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text("s to help you engage."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                  Expanded(child:Text(
                                    'And/or close deals with your clients.',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" Please click on"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.grey,
                                      ),
                                      Text(" this card for more details."),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      '"\$399"',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.indigo,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(

                      child: Container(

                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('Looking for Enterprise solutions?'),
                            MaterialButton(
                              height: 50,
                              onPressed: () {},
                              child: Text(
                                "Contact a Consultant",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 3),
                            child: Text(
                              'Choose from any of our Sales Services ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
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
            ],
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
                      Get.snackbar("Download", "We are working on it");
                    },
                    padding: EdgeInsets.all(0),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text('Download'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
