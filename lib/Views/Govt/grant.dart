import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:fixurbiz_app/Views/Discount/discount_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';

class Grant extends StatefulWidget {
  @override
  GrantState createState() => GrantState();
}
enum GovtType { Less, One,Three,Greater }
class GrantState extends State<Grant> {
  GovtType _character = GovtType.Less;


  @override
  Widget build(BuildContext context) {
    print(Get.arguments.first);
    return
      Scaffold(
        appBar: AppBar(
          title:Text(Get.arguments.first),
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
                Text("Please submit your answers to the following questions.Our Team will get in touch with you.",style: TextStyle(fontWeight:FontWeight.bold ),),
                SizedBox(height: 10.0,),
                Center(child: Text("How old is your business?",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20 ),),),

                  RadioListTile<GovtType>(
                    title:Text("Less than one year old"),
                    value: GovtType.Less,
                    groupValue: _character,
                    onChanged: (GovtType value){
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<GovtType>(
                    title: Text("1-3 years old"),
                    value: GovtType.One,
                    groupValue: _character,
                    onChanged: (GovtType value){
                      setState(() {
                        _character = value;
                      });
                    },
                  ),

                RadioListTile<GovtType>(
                  title: Text("3-5 years old"),
                  value: GovtType.Three,
                  groupValue: _character,
                  onChanged: (GovtType value){
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<GovtType>(
                  title: Text("Greater than 5 years old"),
                  value: GovtType.Greater,
                  groupValue: _character,
                  onChanged: (GovtType value){
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:MaterialButton(
                      disabledColor: Colors.indigo.withOpacity(0.3),
                      disabledTextColor: Colors.white54,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      height: 50.0,
                      color: Colors.indigo,
                      child: Text("Submit",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,),),
                      onPressed: (){


                        Get.arguments.first == null? Center(child: CircularProgressIndicator()):getSaveData(Get.arguments.first);


                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ) ;

  }
  Future<String> getSaveData(String colloectionName) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    final firebase = await Firestore.instance.collection(colloectionName);

    try {
      await firebase.getDocuments().then((QuerySnapshot querySnapshot) {
      if  (querySnapshot.documents.isEmpty) {
        if (_character.toString() ==
            "GovtType.Less") {
          FirestoreService().saveRequests(
              "Less than one year old", Get.arguments.first);
          Navigator.pop(context);
          Get.snackbar("Alert", "Successfully Sent");
        } else if (_character.toString() ==
            "GovtType.One") {
          FirestoreService().saveRequests(
              "1-3 years old", Get.arguments.first);
          Navigator.pop(context);
          Get.snackbar("Alert", "Successfully Sent");
        } else if (_character.toString() ==
            "GovtType.Three") {
          FirestoreService().saveRequests(
              "3-5 years old", Get.arguments.first);
          Navigator.pop(context);
          Get.snackbar("Alert", "Successfully Sent");
        } else {
          FirestoreService().saveRequests(
              "Greater than 5 years old", Get.arguments.first);
          Navigator.pop(context);
          Get.snackbar("Alert", "Successfully Sent");
        }
      }else{

        Navigator.pop(context);
        Get.snackbar("Alert", "You already shared this request");
      }

      });
    } catch (e) {
      Navigator.pop(context);
      Get.snackbar("Error", e.toString());
    }

  }
}
