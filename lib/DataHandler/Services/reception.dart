import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../AllScreens/admin.dart';
import '../Controllers/captains_controller.dart';
import '../Models/CaptainModel.dart';

class Reception {
  // final auth = FirebaseAuth.instance;
  // final firestore = FirebaseFirestore.instance;
  // Future<UserType> fetchUserType() async {
  //   String type = "none";
  //   try {
  //     type = await firestore
  //         .collection("users")
  //         .doc(auth.currentUser!.uid)
  //         .get()
  //         .then((value) => value['userType'].toString());
  //   } catch (e) {
  //     try {
  //       type = await firestore
  //           .collection("admins")
  //           .doc(auth.currentUser!.uid)
  //           .get()
  //           .then((value) => value['userType'].toString());
  //     } catch (e) {
  //       return UserType().instance(type);
  //     }
  //     return UserType().instance(type);
  //   }
  //   return UserType().instance(type);
  // }

  userReception() async {
      Get.put(AdminController());
      Get.offAll(() => AdminScreen());
  }
}
