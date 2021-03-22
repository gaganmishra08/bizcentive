import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'dart:math';
import 'selectable_item.dart';
import 'selection_app_bar.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  String dropdownValue = 'Individual';
  final controller = DragSelectGridViewController();
 List<String> selectedCategory = [];
  List category = ["Entertainment","Shopping","Education","Charity","Sports","Adventure","Travel","Networking"];

  @override
  void initState() {
    super.initState();
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select Category'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.signUp),
          ),
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SafeArea(
          child: Container(
            padding:
                EdgeInsets.only(top: Get.height * 0.02, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "bizcentive",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.indigo),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Text(
                  "Choose an option that describes you best",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "(We will show you relevant Bizcentives)",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),

                /// DropDown Container
                Container(
                  width: double.infinity,
                  //color: Colors.indigo[800],
                  //margin: const EdgeInsets.all(3.0),
                  //padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: Colors.indigo,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: DropdownButton<String>(
                      hint: Text('Describe your self'),
                      // disabledHint: Text('Describe your self',style: TextStyle(color: Colors.white),),
                      isExpanded: true,
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white10,
                      iconSize: 30,
                      elevation: 16,
                      dropdownColor: Colors.indigo,

                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;

                        });
                      },
                      items: <String>[
                        'Individual',
                        'Entrepreneur',
                        'Business',
                        'sales',
                        'other'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Cool! We get All types of businesses to offer great deals and discounts (what we call; Bizcentives) Enjoy Free Offers from your neighborhood stores and Big Box Retailers) Remember, the more time you spend on the App the more Bizcentives you get.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select categories of interest.\nWe'll show you relevant Bizcentives",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),

                Expanded(
                  child: DragSelectGridView(

                    gridController: controller,
                    padding: const EdgeInsets.all(8),
                    itemCount: 8,
                    itemBuilder: (context, index, selected) {
                      if(selected && !selectedCategory.contains(category[index])){
                        selectedCategory.add(category[index]);
                      }

                      return SelectableItem(
                        index: index,
                         color: Colors.indigo,
                        selected: selected,

                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 45,
                    width: 150,
                    child: RaisedButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        //side: BorderSide(color: Colors.red),
                      ),
                      onPressed: () {
                        print(selectedCategory);
                        FirestoreService().saveUserData(dropdownValue, selectedCategory);
                        Get.offNamed(PageIdentifier.adviser);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scheduleRebuild() => setState(() {});

  spaceFromLeft() {
    return SizedBox(
      width: 16,
    );
  }
}
