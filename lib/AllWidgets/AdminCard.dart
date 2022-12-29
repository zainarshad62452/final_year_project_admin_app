import 'package:buraq_admin/AllWidgets/progressDialod.dart';
import 'package:buraq_admin/AllWidgets/warning.dart';
import 'package:flutter/material.dart';

import '../DataHandler/Models/CaptainModel.dart';
import '../DataHandler/Services/driverServices.dart';

Widget AdminCard(
    {required BuildContext context,
      required CaptainModel users,}) {
  final white = TextStyle(color: Colors.white, fontSize: 12.0);
  final heading = TextStyle(
      color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold);
  return Container(
    height: users.type=='isPending'||users.type=='new'?230.0:170.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 59, 88, 97),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(12.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("User", style: heading),
        Row(
          children: [
            Text("Captain Name:", style: white),
            // Spacer(),
            Text("${users.name}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Captain Email:", style: white),
            // Spacer(),
            Text("${users.email}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Captain CNIC:", style: white),
            // Spacer(),
            Text("${users.cnic}", style: white)
          ],
        ),
        Row(
          children: [
            Text("License Number:", style: white),
            // Spacer(),
            Text("${users.licenseNumber}", style: white)
          ],
        ),
        Row(
          children: [
            Text("License Expiry:", style: white),
            // Spacer(),
            Text("${users.expiry}", style: white)
          ],
        ),
        Row(
          children: [
            Text("License City:", style: white),
            // Spacer(),
            Text("${users.cityOfLicense}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Registration Number:", style: white),
            // Spacer(),
            Text("${users.carNumber}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Engine Number:", style: white),
            // Spacer(),
            Text("${users.carColor}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Car Model:", style: white),
            // Spacer(),
            Text("${users.carModel}", style: white)
          ],
        ),
        Row(
          children: [
            Text("Car Tax Expiry:", style: white),
            // Spacer(),
            Text("${users.carTax}", style: white)
          ],
        ),
        Visibility(
          visible: users.type=='isPending',
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                      elevation: 100,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Color(0xFFc6520a),
                      child: MaterialButton(
                        child: Text("Accept",style: TextStyle(color: Colors.black),),
                        onPressed: () => WarningDialog(
                            context: context,
                            title:
                            "Are you sure you want to make this an Captain",
                            onYes: () =>
                                DriverData().approveCaptain(users,context)),)),
                  // Spacer(),
                  // SizedBox(
                  //     width: 100.0,
                  //     child: MaterialButton(
                  //       child: Text("Pending",style: TextStyle(color: Colors.black),),
                  //
                  //       color: Colors.yellow,
                  //       onPressed: () => WarningDialog(
                  //           context: context,
                  //           title:
                  //           "Are you sure you want to send their request in pending",
                  //           onYes: () =>
                  //               DriverData().setpending(user,context)),)),
                  // Spacer(),
                  SizedBox(width: 5.0,),
                  Card(
                      elevation: 100,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Colors.black,
                      child: MaterialButton(
                        child: Text("Decline",style: TextStyle(color: Colors.black),),

                        onPressed: () => WarningDialog(
                            context: context,
                            title:
                            "Are you sure you want to block their request",
                            onYes: () =>
                                DriverData().blockrequest(users,context)),)),
                ],
              )
            ],
          ),),
        Visibility(

          visible: users.type=='new',
          child: Column(

            children: [
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                      elevation: 100,
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Color(0xFFc6520a),
                      child: MaterialButton(
                        child: Text("Accept",style: TextStyle(color: Colors.black),),
                        onPressed: () => WarningDialog(
                            context: context,
                            title:
                            "Are you sure you want to make this an Captain",
                            onYes: () =>
                                DriverData().approveCaptain(users,context)),)),
                  // Spacer(),
                  SizedBox(width: 5.0,),
                  Card(
                    elevation: 100,
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Color(0xFFc6520a),
                    child:
                    MaterialButton(
                      child: Text("Pending",style: TextStyle(color: Colors.black),),

                      onPressed: () => WarningDialog(
                          context: context,
                          title:
                          "Are you sure you want to send their request in pending",
                          onYes: ()
                          {
                            DriverData().setpending(users, context);}),),),
                  // Spacer(),
                  SizedBox(width: 5.0,),
                  Card(
                      elevation: 100,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadowColor: Color(0xFFc6520a),
                      child: MaterialButton(
                        child: Text("Decline",style: TextStyle(color: Colors.black),),
                        onPressed: () => WarningDialog(
                            context: context,
                            title:
                            "Are you sure you want to block their request",
                            onYes: () =>
                                DriverData().blockrequest(users,context)),)),
                ],
              )
            ],
          ),),

      ],
    ),
  );
  print('hahahaha');
}