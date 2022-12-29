import 'package:buraq_admin/AllScreens/mainscreen.dart';
import 'package:buraq_admin/DataHandler/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';
import '../AllWidgets/AdminCard.dart';
import '../AllWidgets/custom_button.dart';
import '../AllWidgets/progressDialod.dart';
import '../AllWidgets/warning.dart';
import '../DataHandler/Controllers/captains_controller.dart';
import '../DataHandler/Models/CaptainModel.dart';
import '../DataHandler/Services/driverServices.dart';

class AdminScreen extends StatelessWidget {

  static const String idScreen = 'Admin';
  String? type;

   AdminScreen({this.type,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"),
      leading: IconButton(onPressed: (){Get.to(()=>MainScreen());}, icon: Icon(Icons.arrow_back)),
      backgroundColor: kMainColor,
      ),
      body: Stack(
        children: [
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                if (captainController.allCapatins != null) SizedBox(
                  height: 800.0,
                  child: ListView.builder(
                      itemCount: captainController.allCapatins!.length,
                      itemBuilder: (context, index) {
                        if(captainController.allCapatins![index].type=='captain'&&type=="Verified"){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AdminCard(
                                context: context,
                                users: captainController.allCapatins![index]),
                          );
                        }else if(captainController.allCapatins![index].type=='new'&&type=="new"){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AdminCard(
                                context: context,
                                users: captainController.allCapatins![index]),
                          );
                        }else if(captainController.allCapatins![index].type=='isPending'&&type=="pending"){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AdminCard(
                                context: context,
                                users: captainController.allCapatins![index]),
                          );
                        }else if(type=="all"){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: AdminCard(
                                context: context,
                                users: captainController.allCapatins![index]),
                          );
                        } else{
                          return SizedBox();
                        }
                      }),
                ) else ProgressDialod(message: "wait"),
              ],),
            );
          }),

        ],
      ),
    );
  }
}


