import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class Assisment extends StatefulWidget {
  @override
  _AssismentState createState() => _AssismentState();
}

enum AssismentType { Less, One, Three, Greater }

class _AssismentState extends State<Assisment> {
  AssismentType _character = AssismentType.Less;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assisment'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.toNamed(PageIdentifier.tabPage),
          ),
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Please submit your answers to the following questions.Our Team will get in touch with you.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    "How old is your business?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                RadioListTile<AssismentType>(
                  title: Text("Less than one year old"),
                  value: AssismentType.Less,
                  groupValue: _character,
                  onChanged: (AssismentType value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<AssismentType>(
                  title: Text("1-3 years old"),
                  value: AssismentType.One,
                  groupValue: _character,
                  onChanged: (AssismentType value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<AssismentType>(
                  title: Text("3-5 years old"),
                  value: AssismentType.Three,
                  groupValue: _character,
                  onChanged: (AssismentType value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<AssismentType>(
                  title: Text("Greater than 5 years old"),
                  value: AssismentType.Greater,
                  groupValue: _character,
                  onChanged: (AssismentType value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                Text(
                    "Describe your answer (also use this section if your answer is a combination of answers or is something completely different)"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 5,
                  controller: _controller,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'Tell us about business',
                      suffixStyle: const TextStyle(color: Colors.indigo)),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      disabledColor: Colors.indigo.withOpacity(0.3),
                      disabledTextColor: Colors.white54,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 50.0,
                      color: Colors.indigo,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        if (_controller.text.isEmpty &&
                            _controller.text.length == 0) {
                          Navigator.pop(context);
                          Get.snackbar("Alert", "Please fill the description ");

                        } else {
                          getSaveData("assisment");

                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getSaveData(String colloectionName) async {
    final firebase = await Firestore.instance.collection(colloectionName);

    try {
      await firebase.getDocuments().then((QuerySnapshot querySnapshot) {

        if  (querySnapshot.documents.isEmpty) {
          if (_character.toString() ==
              "AssismentType.Less") {
            FirestoreService().saveAssisment(
                "Less than one year old", _controller.text);
            Navigator.pop(context);
            Get.snackbar("Alert", "Successfully Sent");
          } else if (_character.toString() ==
              "AssismentType.One") {
            FirestoreService().saveAssisment(
                "1-3 years old", _controller.text);
            Navigator.pop(context);
            Get.snackbar("Alert", "Successfully Sent");
          } else if (_character.toString() ==
              "AssismentType.Three") {
            FirestoreService().saveAssisment(
                "3-5 years old", _controller.text);
            Navigator.pop(context);
            Get.snackbar("Alert", "Successfully Sent");
          } else {
            FirestoreService().saveAssisment(
                "Greater than 5 years old", _controller.text);
            Navigator.pop(context);
            Get.snackbar("Alert", "Successfully Sent");
          }
        }
          else {
            Navigator.pop(context);
            Get.snackbar(
                "Alert", "You already shared this request");
          }
        });


    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
