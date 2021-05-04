import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:get/get.dart';

class FirestoreService {
  final firestoreInstance = Firestore.instance.collection("user");
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      String company) async {
    try {
      final firebase = Firestore.instance.collection("user");
      FirebaseUser user = await auth.currentUser();

      final path = firebase.document(user.uid);
     List<dynamic> list =  [{
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

      }];

      print("Json here"+list.toString());

      path.updateData(
          {
            "cards":FieldValue.arrayUnion(list)
          }

      );
    } catch (e){
      Get.snackbar("Error",e.toString() );
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
