import 'package:fixurbiz_app/Model/userModel.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<String> profileSetting = ["Change Password","Bizcentive Coins","Add Coins","Add Card","Logout"];


  Rx<User> user = Rx<User>();

 loadUserData() async {

    final userData = await FirestoreService().getUserData();

    if (userData.exists) {

      User userDatas = User.fromJson(userData.data);

      user.value = userDatas;

    } else {
      Get.snackbar("Error", "Something went wrong");
    }

  }
  updateData(String image) async{
   final userData = await FirestoreService().getUserData();
   
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserData();
  }
}
