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
  var cardItems = List<CardViewModel>().obs;
  RxBool showHideToggle = true.obs;

  // get menuItemsCount => isToggled.value ? communityList.length : businessList.length;
  // get menuItem(int index)=>
  @override
  void onInit() {
    super.onInit();
    loadUserData();
    _loadCardItems();
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
      Menu(AppImage.menu_discount, "Discount"),
      Menu(AppImage.menu_networking, "Networking"),
      Menu(AppImage.menu_experts, "Experts"),
    ]);
  }

  void _loadCardItems() {
    cardItems.assignAll([
      CardViewModel('Get a Sales Expert to build an outbound Sales Process',
          "Get a Sales Expert and Consultant to understand your company's business model and build a brilliant Sales Process.More detail in Term.",
          id: 'BC4567554',
          fullFiledBy: 'Bizcentive Inc.',
          category: "Sales",
          cost: "12600 Coins",
          location: "Sunnyvale, CA, USA",
          cardColor: Colors.indigo[900]),
      CardViewModel(
          "Get 40% off on Premium Laptops, Accessories, Switches and Routers",
          "Whe have a stock of 249 laptops that are unsold from last year, we've willing to sell it for ${220} each. See Details in Terms.",
          id: "CC4567554",
          fullFiledBy: "Bizcentive Community",
          cost: "Discuss with Community Member",
          cardColor: Colors.green[900]),
      CardViewModel("Get New Carpets and Drapes for as low as ${400}",
          "This is a closing Sale, We are closing out on old inventory. Everything must go, Please feel free to reach out to any of your home interior needs",
          id: "SC4567554",
          fullFiledBy: "Sponsored",
          cost: "Discuss to Sponsor",
          cardColor: Colors.orange[800]),
    ]);
  }

  void updateCardIndex() {
    if (cardIndex < cardItems.length) {
      cardIndex += 1;
    }
  }

  CardViewModel cardItem() {
    return cardItems[cardIndex.value];
  }
}
