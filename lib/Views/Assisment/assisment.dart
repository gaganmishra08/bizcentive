import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
class Assisment extends StatefulWidget {
  @override
  _AssismentState createState() => _AssismentState();
}
enum AssismentType { Less, One,Three,Greater }
class _AssismentState extends State<Assisment> {
  AssismentType _character = AssismentType.Less;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text('Assisment'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.tabPage),
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

              RadioListTile<AssismentType>(
                title:Text("Less than one year old"),
                value: AssismentType.Less,
                groupValue: _character,
                onChanged: (AssismentType value){
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<AssismentType>(
                title: Text("1-3 years old"),
                value: AssismentType.One,
                groupValue: _character,
                onChanged: (AssismentType value){
                  setState(() {
                    _character = value;
                  });
                },
              ),

              RadioListTile<AssismentType>(
                title: Text("3-5 years old"),
                value: AssismentType.Three,
                groupValue: _character,
                onChanged: (AssismentType value){
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<AssismentType>(
                title: Text("Greater than 5 years old"),
                value: AssismentType.Greater,
                groupValue: _character,
                onChanged: (AssismentType value){
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text("Describe your answer (also use this section if your answer is a combination of answers or is something completely different)"),
              SizedBox(height: 10,),
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

                    },
                  ),
                ),
              )
            ],
              ),
          ),
        ),
      ) ,
    );
  }
}
