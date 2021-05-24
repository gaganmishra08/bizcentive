import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixurbiz_app/Model/cardModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SalesController extends GetxController {
  var salesCard = <CardElement>[].obs;
  var filteredList = <CardElement>[].obs;
  var savedCards = <CardElement>[].obs;
  var rejectedCards = <CardElement>[].obs;
  var acceptedCards = <CardElement>[].obs;
  final firestoreCards = Firestore.instance.collection("cards");
  String userID;

  @override
  void onInit() {
    super.onInit();
    loadCardItems();
    loadSavedCards();
    loadAcceptedCards();
    loadRejectedCards();
    getPrefsData();
  }

  getPrefsData() async {
    final box = GetStorage();
    userID = box.read("userID");
  }

  getSerach(String text, TextEditingController search,bool isSaved,bool isSalesCard,bool isRejectedCard,bool isAcceptedCard) {
    if (text.isEmpty || text.length == 0) {
      search.clear();
      filteredList.clear();
    } else {
      if (text.length >= 3) {
        if(isSalesCard){
          filteredList.clear();
        salesCard.forEach((element) {
          if (element.title.toLowerCase().contains(text.toLowerCase())) {
            if (!filteredList.contains(element)) {
              filteredList.add(element);
            }
          }
        });}else if (isSaved){
          filteredList.clear();
          savedCards.forEach((element) {
            if (element.title.toLowerCase().contains(text.toLowerCase())) {
              if (!filteredList.contains(element)) {
                filteredList.add(element);
              }
            }
          });
        }
        else if(isRejectedCard){
          filteredList.clear();
          rejectedCards.forEach((element) {
            if (element.title.toLowerCase().contains(text.toLowerCase())) {
              if (!filteredList.contains(element)) {
                filteredList.add(element);
              }
            }
          });
        }
        else{
          filteredList.clear();
          acceptedCards.forEach((element) {
            if (element.title.toLowerCase().contains(text.toLowerCase())) {
              if (!filteredList.contains(element)) {
                filteredList.add(element);
              }
            }
          });
        }
      }
    }
  }

  Future<void> loadSavedCards() async {

    QuerySnapshot querySnapshot =
    await Firestore.instance.collection("saveCards").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try {
        final res = Cards.fromMap(a.data);
        savedCards.clear();
        res.cards.forEach((element) {

          if (element.bezcentiveId == userID && element.isCardSaved) {

              savedCards.add(element);

          }
        });

      } catch (e) {
        print(e);
      }


    }
  }

  Future<void> loadRejectedCards() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("rejectedCards").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try {
        final res = Cards.fromMap(a.data);
        res.cards.forEach((element) {
          if (element.bezcentiveId == userID && element.isCardRejected) {
              rejectedCards.add(element);

          }
        });
      } catch (e) {
        print(e);
      }

    }
  }

  Future<void> loadAcceptedCards() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("acceptedCards").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try {
        final res = Cards.fromMap(a.data);
        res.cards.forEach((element) {

            if (element.bezcentiveId == userID && element.isCardAccepted) {
              acceptedCards.add(element);
            }

        });
      } catch (e) {
        print(e);
      }

    }
  }

  Future<void> loadCardItems() async {
    QuerySnapshot querySnapshot =
        await Firestore.instance.collection("cards").getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      //a.data
      try {
        final res = Cards.fromMap(a.data);
        res.cards.forEach((element) {
          if (element.bezcentiveId != userID) {
            salesCard.add(element);
          }
        });
      } catch (e) {
        print(e);
      }

    }
  }
}
