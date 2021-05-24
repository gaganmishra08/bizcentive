import 'package:fixurbiz_app/Model/cardViewModel.dart';
import 'package:fixurbiz_app/Model/userModel.dart';
import 'package:fixurbiz_app/Utility/firestore_service.dart';

import '../../Utility/appImage.dart';
import '../Card/bizcentiveCardView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //var currentSteps = 1.obs;
  var count = 0.obs;
  var isToggled = false.obs;
  var cardIndex = 0.obs;
  var showCardItem = false.obs;
  var businessList = List<Menu>().obs;
  var communityList = List<Menu>().obs;

  RxBool showHideToggle = true.obs;
  List<CardViewModel> category;
  // get menuItemsCount => isToggled.value ? communityList.length : businessList.length;
  // get menuItem(int index)=>
  @override
  void onInit() {
    super.onInit();

    loadUserData();

  }

  void loadUserData() async {
    final userData = await FirestoreService().getUserData();
    if (userData.exists) {
      User user = User.fromJson(userData.data);

      loadBussinessItems(user);
      loadCommunityItems(user);
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void loadBussinessItems(User fUser) async {

    if (fUser.interest == 'Individual') {

      showHideToggle.value = true;
      businessList.assignAll([

      ]);
    } else {
      showHideToggle.value = false;
      businessList.assignAll([
        Menu(AppImage.appIcon_asissment, "Assisment"),
        Menu(AppImage.menu_sale, "Sales"),
        Menu(AppImage.menu_marketing, "Marketing"),
        Menu(AppImage.menu_legal, "Legal"),
        Menu(AppImage.menu_tax, "Tax & CPA"),
        Menu(AppImage.menu_tech, "Tech"),
        Menu(AppImage.menu_hr, "HR"),
        Menu(AppImage.menu_grants, "Govt.Grants"),
        Menu(AppImage.menu_investment, "Investors"),
        Menu(AppImage.menu_give, "Govt.Jobs"),
        Menu(AppImage.menu_hr, "My Activity"),
      ]);
    }
  }

  void loadCommunityItems(User fUser) {
    communityList.assignAll([
      //Get.snackbar("Alert", "We are working on it"),
      Menu(AppImage.menu_discount, "Discount"),
      Menu(AppImage.menu_networking, "Networking"),
      Menu(AppImage.menu_experts, "Experts"),
    ]);
  }




}
