import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import 'package:get/get.dart';

class TermsView extends StatelessWidget {
  final Function onBack;

  const TermsView({Key key, this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Term'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            onPressed: () => Get.offNamed(PageIdentifier.cardView),
          ),
          //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Condition 01",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 5,),
                Text(
                    "These Terms and Conditions are a legally binding set of rules about use of a website. They set out how users may use the site, and what they can and cannot do on the site. For example, if a user posts offensive or defamatory content on a website, the owner of the site will want to have Terms and Conditions to fall back on which clearly state that the owner of the site does not permit or take responsibility for that offensive content, and that any liability (such as a defamation claim) should therefore sit with the user. In addition, the owner of the site may want to have the ability to terminate the user's account - and this also will need to be explained in the Terms and Conditions."),
                Text(
                  "Condition 02",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                ),
            SizedBox(height: 5,),
                Text("These Terms and Conditions are a legally binding set of rules about use of a website. They set out how users may use the site, and what they can and cannot do on the site. For example, if a user posts offensive or defamatory content on a website, the owner of the site will want to have Terms and Conditions to fall back on which clearly state")

              ],
            ),
          ),
        ),
      ),
    );
  }
}
