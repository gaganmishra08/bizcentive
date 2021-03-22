import 'dart:io';

import 'package:fixurbiz_app/Utility/google_signin.dart';
import 'package:fixurbiz_app/Views/Profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = Get.put(ProfileController());

  File _image;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Center(
                        child: TextButton(
                            onPressed: () {
                              _showPicker(context);
                              if (_image != null) {}
                            },
                            child: _loadImageForProfile()),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(() => (controller.user.value==null)? Container(): Column(
                        children: [
                          Text((controller.user.value.name != null &&
                                  controller.user.value.name != "")
                              ? controller.user.value.name
                              : "NA"),
                          Text((controller.user.value.email != null &&
                                  controller.user.value.email != "")
                              ? controller.user.value.email
                              : "NA"),
                        ],
                      )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.profileSetting.length,
                  itemBuilder: (context, position) {
                    return Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (position == 0) {

                          }else if(position==1){

                          }else if(position==2){

                          }
                          else if(position==3){
                            Get.offNamed(PageIdentifier.addCard);

                          }
                          else if(position==4){
                            SignIn().signOut();
                            Get.offNamed(PageIdentifier.login);
                          }


                        },
                        child: Text(
                          controller.profileSetting[position],
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _loadImageForProfile() {
    return Obx(() => (controller.user.value==null) ? Container(
      height: 120,
      width: 120,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey)),
        child: ClipOval(
          child: Icon(
            FontAwesomeIcons.user,
            color: Colors.grey,
          ),
        ),
      ),
    ) : (controller.user.value.image != null)
        ? ClipOval(
            child: Image.network(
              controller.user.value.image,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          )
        : (_image!=null)
            ? ClipOval(
                child: Image.file(
                  _image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                height: 120,
                width: 120,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)),
                  child: ClipOval(
                    child: Icon(
                      FontAwesomeIcons.user,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ));
  }

}
