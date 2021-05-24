import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Model/cardModel.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class cardController extends GetxController {
  final firestoreCards = Firestore.instance.collection("cards");
  RxList cardItems = <CardElement>[].obs;
  RxList cardsStatus = <CardElement>[].obs;

RxBool isSavedCard = false.obs;
RxBool isRejectedCard = false.obs;
RxBool isAcceptedCard = false.obs;

  String userID;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadCardItems();
    getPrefsData();


  }

  getPrefsData() async {
    final box = GetStorage();
    userID = box.read("userID");
  }

  Future<void> loadCardItems() async {
    QuerySnapshot querySnapshot = await Firestore.instance.collection("cards").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try{
    final res = Cards.fromMap(a.data);
    res.cards.forEach((element) {
      if (element.bezcentiveId != userID){

        cardItems.add(element);


      }

    }) ;

      }catch(e){
        print(e);
      }
      update();
      cardItems.shuffle();
    }

  }
  Future<void> getCardStatus(String collectionName) async {
    QuerySnapshot querySnapshot = await Firestore.instance.collection(collectionName).getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try{
    final res = Cards.fromMap(a.data);
    res.cards.forEach((element) {
      cardsStatus.add(element);

        if (element.bezcentiveId == userID){
          if (element.isCardAccepted){
            isAcceptedCard.value = true;

          }
          else if (element.isCardRejected){
            isRejectedCard.value = true;
          }
          else {
            isSavedCard.value = true;
          }

        }




    }) ;

      }catch(e){
        print(e);
      }

    }

  }


}
