import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixurbiz_app/Model/userModel.dart';
import 'package:fixurbiz_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirestoreService {
  final firestoreInstance = Firestore.instance.collection("user");
  final FirebaseAuth auth = FirebaseAuth.instance;

  saveUserData(String interest, List<String> categories) async {
    try {
      FirebaseUser user = await auth.currentUser();
      final path = firestoreInstance.document(user.uid);
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

  Future<DocumentSnapshot> getUserData() async{
    try{
      FirebaseUser user = await auth.currentUser();
      final path = firestoreInstance.document(user.uid);
      final result = path.get();

           return result;

    }
    catch(e){
      Get.snackbar('Error', e.toString());

    }
  }
}
