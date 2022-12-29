

import 'package:buraq_admin/AllScreens/loginScreen.dart';
import 'package:buraq_admin/AllWidgets/progressDialod.dart';
import 'package:buraq_admin/DataHandler/Models/CaptainModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverData{

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  static var value = 0.obs;

  var totalApprovedDrivers=0.obs;
  var totalUnApprovedDrivers = 0.obs;
  var totalDrivers=0.obs;
  var totalPendingDrivers = 0.obs;

  Stream<List<CaptainModel>>? streamAllCaptains() {
    try {
      return firestore.collection("captain").snapshots().map((event) {

        List<CaptainModel> list = [];
        event.docs.forEach((element) {

          final admin = CaptainModel.fromJson(element.data());
            list.add(admin);
        });
        return list;
      });
    } catch (e) {
      return null;
    }
  }



  approveCaptain(CaptainModel users,context) async {
    try {
      showDialog(context: context, builder: (ctx){
        return ProgressDialod(message: "Approving Captain! Please wait",);
      });
      print("objectUID");
      print(users.uid);
      await firestore
          .collection("captain")
          .doc(users.uid)
          .update({"type": 'captain'});
      displayToastMessage("The selected Captain is Approved", context).then((value) => displayToastMessage("The selected Captain is Approved", context))
          .onError((error, stackTrace) => displayToastMessage("Error $error", context));
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }
  uploadImage(CaptainModel users,context) async {
    try {
      print("objectUID");
      print(users.uid);
      await firestore
          .collection("captain")
          .doc(users.uid)
          .update({"isVerified": true})
          .then((value) => displayToastMessage("The selected Captain is Approved", context))
          .onError((error, stackTrace) => displayToastMessage("Error $error", context));

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
    }
  }

  blockrequest(CaptainModel users,context) async {
    try {
      showDialog(context: context, builder: (ctx){
        return ProgressDialod(message: "Setting Users To Block Please wait",);
      });
      await firestore
          .collection("captain")
          .doc(users.uid)
          .update({"type": 'blocked'})
          .then((value) => displayToastMessage("The selected Captain is set to blocked", context))
          .onError((error, stackTrace) => displayToastMessage("Error $error", context));
      Navigator.pop(context);

    } catch (e) {
      Navigator.pop(context);
    }
  }

  setpending(CaptainModel users,context) async {
    try {
      showDialog(context: context, builder: (ctx){
        return ProgressDialod(message: "Setting Users To Pending Please wait",);
      });
      // await FirebaseDatabase.instance.ref().child("captain").child(users.uid.toString()).update({"isPending": false});
      await firestore
          .collection("captain")
          .doc(users.uid)
          .update({"type": 'isPending'}).then((value) => displayToastMessage("The selected Captain is set to Pending Drivers", context))
          .onError((error, stackTrace) => displayToastMessage("Error $error", context));
      displayToastMessage("The selected Captain is set to Pending Drivers", context);

      Navigator.pop(context);

    } catch (e) {
      Navigator.pop(context);
    }
  }


}