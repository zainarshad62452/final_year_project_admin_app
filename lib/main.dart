import 'package:buraq_admin/AllScreens/loginScreen.dart';
import 'package:buraq_admin/AllScreens/splashScreen.dart';
import 'package:buraq_admin/DataHandler/Controllers/captains_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'AllScreens/admin.dart';
import 'AllScreens/captainsDetailsScreen.dart';
import 'AllScreens/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
DatabaseReference userRef = FirebaseDatabase.instance.ref().child('admin');
DatabaseReference user_Ref = FirebaseDatabase.instance.ref().child('users');
DatabaseReference user_capRef = FirebaseDatabase.instance.ref().child('captain');
FirebaseFirestore user_Refire = FirebaseFirestore.instance.collection('users') as FirebaseFirestore;
FirebaseFirestore user_capRefire = FirebaseFirestore.instance.collection('captain') as FirebaseFirestore;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Buraaq Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.idScreen,
      routes: {
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) {
          Get.put(AdminController());
          return MainScreen();
        },
        AdminScreen.idScreen: (context) => AdminScreen(),
        SplashScreen.idScreen: (context) => SplashScreen(),
        DriversDataScreen.idScreen: (context) => DriversDataScreen(choice: '',title_text: '',),

      }
    );
  }
}

