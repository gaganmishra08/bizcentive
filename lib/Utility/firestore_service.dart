import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixurbiz_app/Model/cardModel.dart';
import 'package:fixurbiz_app/Model/cardViewModel.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:get/get.dart';

class FirestoreService {
  final categories = Firestore.instance.collection("categories");
  final firestoreInstance = Firestore.instance.collection("user");
  final firestoreCards = Firestore.instance.collection("cards");
  final FirebaseAuth auth = FirebaseAuth.instance;

  //List<String> categoriesList = ["Entertainment","Shopping","Education","Charity","Sports","Adventure","Travel","Networking"];
  saveUserData(String interest, List<String> categories) async {
    try {
      FirebaseUser user = await auth.currentUser();
      final path = firestoreInstance.document(user.uid);
      print(path);
      path.setData({
        'name': user.displayName,
        'email': user.email,
        'id': user.uid,
        'image': user.photoUrl,
        'interest': interest,
        'category': categories
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

// saveCategories()async{
//     try{
//     categories.add({"categories":categoriesList});
//     }catch(e){
//       Get.snackbar("Error", e.toString());
//     }
//}

  saveCard(
      String type,
      String subType,
      String source,
      String location,
      String title,
      String description,
      String regularPrice,
      String discount,
      String reducedPrice,
      String valid,
      String bezcentiveID,
      String redemptionID,
      String phone,
      String email,
      String refer,
      String company,
      String country,
      bool isCardAccepted,
      bool isCardRejected,
      bool isCardSaved) async {

    try {
      final firebase = Firestore.instance.collection("cards");
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);
      List<dynamic> list = [
        {
          "type": type,
          "subType": subType,
          "source": source,
          "location": location,
          "title": title,
          "description": description,
          "regularPrice": regularPrice,
          "discount": discount,
          "reducedPrice": reducedPrice,
          "valid": valid,
          "bezcentiveID": bezcentiveID,
          "redemptionID": redemptionID,
          "phone": phone,
          "email": email,
          "company": company,
          "refer": refer,
          "country": country,
          "isCardSaved":isCardSaved,
          "isCardRejected":isCardRejected,
          "isCardAccepted":isCardAccepted,

        }
      ];

      print("Json here" + list.toString());

      path.setData({"cards": FieldValue.arrayUnion(list)}, merge: true);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  savedCard(
     CardElement card,String collectionName,bool isCardSaved,bool  isCardRejected,bool isCardAccepted) async {
    try {
      final firebase = Firestore.instance.collection(collectionName);
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);
      List<dynamic> list = [
        {
          "type": card.type,
          "subType": card.subType,
          "source": card.source,
          "location": card.location,
          "title": card.title,
          "description": card.description,
          "regularPrice": card.regularPrice,
          "discount": card.discount,
          "reducedPrice": card.reducedPrice,
          "valid": card.valid,
          "bezcentiveID": user.uid,
          "redemptionID": card.redemptionId,
          "phone": card.phone,
          "email": card.email,
          "company": card.company,
          "refer": card.refer,
          "country": card.country,
          "isCardSaved":isCardSaved,
          "isCardRejected":isCardRejected,
          "isCardAccepted":isCardAccepted,
        }
      ];

      print("Json here" + list.toString());

      path.setData({"cards": FieldValue.arrayUnion(list)}, merge: true);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  saveAssisment(
    String businessYears,
    String about,
  ) async {
    try {
      final firebase = Firestore.instance.collection("assisment");
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);

      path.setData({
        "businessYears": businessYears,
        "about": about,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  saveRequests(String businessYears, String colloectionName) async {
    try {
      final firebase = Firestore.instance.collection(colloectionName);
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);

      path.setData({
        "businessYears": businessYears,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  saveReferalRequests(String name, String email,String businessName,String name1, String email1,String businessName1,String name2, String email2,String businessName2) async {
    try {
      final firebase = Firestore.instance.collection("refer");
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);

      path.setData({
        "refer":{
        "name": name,
        "email": email,
        "address":businessName,},
      "refer1":{
        "name": name1,
        "email": email1,
        "address":businessName1,},
      "refer2":{
        "name": name2,
        "email": email2,
        "address":businessName2},
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  Future<String> getSaveData(String colloectionName) async {
    final firebase = await Firestore.instance.collection(colloectionName);

    try {
      await firebase.getDocuments().then((QuerySnapshot querySnapshot) {
        querySnapshot.documents.forEach((doc) {
          final result =  doc.documentID;
          print(result);
          return result;
        });
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<DocumentSnapshot> getCards() async {
    try {
      final res = FirestoreService().firestoreCards.getDocuments();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<DocumentSnapshot> getUserData() async {
    try {
      FirebaseUser user = await auth.currentUser();
      final path = firestoreInstance.document(user.uid);
      final result = path.get();

      return result;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
