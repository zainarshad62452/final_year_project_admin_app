import 'package:buraq_admin/AllWidgets/progressDialod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../AllWidgets/custom_button.dart';
import '../AllWidgets/custom_Button_Main.dart';
import '../AllWidgets/warning.dart';
import '../DataHandler/Models/CaptainModel.dart';
import '../DataHandler/Services/driverServices.dart';
import 'mainscreen.dart';
import 'captainDataHandler.dart';
class DriversDataScreen extends StatefulWidget {
  static const String idScreen = "QuestionnaireResultScreen";

  String choice;
  String title_text;
   DriversDataScreen({Key? key,required this.choice,required this.title_text}) : super(key: key);

  @override
  State<DriversDataScreen> createState() => _DriversDataScreenState(choice: choice,title_text: title_text);
}

class _DriversDataScreenState extends State<DriversDataScreen> {

  String choice;
  String title_text;
  _DriversDataScreenState({required this.choice,required this.title_text});

  List<Widget> pendingDrivers = [];
  List<Widget> verifiedDrivers = [];
  List<Widget> notVerifiedDrivers =[];
  List<Widget> Details=[];
  int totalPendingDrivers=0;
  int totalVerifiedDrivers=0;
  int totalNotVerifireDrivers=0;
  int totalDrivers=0;
  late String status;




  @override
  Widget build(BuildContext context) {
    Stream<List<CaptainModel>> readUsers()=>FirebaseFirestore
        .instance
        .collection('captain')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => CaptainModel
        .fromJson(doc.data()))
        .toList());
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
        backgroundColor: Color(0xFFc6520a),
      ),
      body: StreamBuilder<List<CaptainModel>>(
        stream: readUsers(),
        builder: (context,snapshot ) {
          if(snapshot.hasError){
            print(snapshot.data);
            return Text('Something went wrong ${snapshot.error}');
          }
          else if(snapshot.hasData){
            final users = snapshot.data!;

            for(var user in users){
              if(user.type=='isPending'!){
                status="Pending";
                pendingDrivers.add(UserDataHandler().buildUser(user,status,context));
                totalPendingDrivers++;
              }

              if(user.type == 'captain'!){
                status="Verified";
                verifiedDrivers.add(UserDataHandler().buildUser(user,status,context));
                totalVerifiedDrivers++;
              }

              if(user.type == 'new'){
                status="New Request";
                notVerifiedDrivers.add(UserDataHandler().buildUser(user,status,context));
                totalNotVerifireDrivers++;
              }

              Details.add(UserDataHandler().buildUser(user,status,context));
              totalDrivers++;
            }
            return Stack(
              children: [
                ListView(
                children: [
                  // Container(child: Center(child: Text("$title_text",style: TextStyle(fontSize: 50.0,fontFamily: "Brand-Bold",color: Colors.grey),))),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: 100,
                        color: Color(0xFFc6520a),
                        child: Center(child: Center(child: Text("$title_text",style: TextStyle(fontSize: 25.0,fontFamily: "Brand-Bold",color: Colors.white),))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Column(
                    children: getUserDetails(),
                  ),

                ],
              ),
                Positioned(
                  left: 150.0,
                  bottom: 20.0,
                  child: customButtonMain(
                    text: "Main Menu",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, MainScreen.idScreen, (route) => false);
                    },
                  ),
                ),
          ]
            );
          }else{
            return Center(child: ProgressDialod(message: "Please wait! Setting things for you"),);
          }
        },

      ),
    );



  }
  List<Widget> getUserDetails(){
    if(choice=="verified"){
      if(totalVerifiedDrivers==0){
        return [Text("No Verified User",style: TextStyle(fontSize: 30.0,fontFamily: "Brand-Bold"),),
        Image(image: AssetImage("images/donot.png")),
        ];
      }else{
        return verifiedDrivers;
      }

    }else if(choice == "notVerified"){

      if(totalNotVerifireDrivers==0){
        return [Text("No new Requests",style: TextStyle(fontSize: 30.0,fontFamily: "Brand-Bold"),),
          Image(image: AssetImage("images/donot.png")),
        ];
      }else{
        return notVerifiedDrivers;
      }

    }else if(choice == "pending"){
      if(totalPendingDrivers==0){
        return [Text("No Pending Requests",style: TextStyle(fontSize: 30.0,fontFamily: "Brand-Bold"),),
          Image(image: AssetImage("images/donot.png")),
        ];

      }else{
        return pendingDrivers;
      }

    }else if(choice == "allDrivers"){
      if(totalDrivers==0){
        return [Text("No User",style: TextStyle(fontSize: 30.0,fontFamily: "Brand-Bold"),),
          Image(image: AssetImage("images/donot.png")),
        ];
      }else {
        return Details;
      }
    }else{
      return [SizedBox()];
    }

  }
}


