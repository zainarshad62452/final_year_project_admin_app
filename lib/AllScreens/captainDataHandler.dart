

import '../AllWidgets/warning.dart';
import '../DataHandler/Models/CaptainModel.dart';
import 'package:flutter/material.dart';

import '../DataHandler/Services/driverServices.dart';
class UserDataHandler{

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  static const kTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: "Brand-Regular",

  );

  Widget buildUser(CaptainModel user,String status,context)=>Padding(
    padding: const EdgeInsets.all(30.0),
    child: Card(
      elevation: 100,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Color(0xFFc6520a),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}',style:kTextStyle,),
            Text('Email: ${user.email}',style:kTextStyle,),
            Text('Phone Number: ${user.phone}',style:kTextStyle,),
            Text('CNIC Number: ${user.cnic}',style:kTextStyle,),
            Text("License Number: ${user.licenseNumber}",style:kTextStyle,),
            Text('License City: ${user.cityOfLicense}',style:kTextStyle,),
            Text('License Expiry Date: ${user.expiry}',style:kTextStyle,),
            Text('Car Model: ${user.carModel}',style:kTextStyle,),
            Text("Registration Number: ${user.carNumber}",style:kTextStyle,),
            Text('Engine Number: ${user.carColor}',style:kTextStyle,),
            Text('Tax Payment Date: ${user.expiry}',style:kTextStyle,),
            Text('Status: $status',style:kTextStyle,),

            Visibility(

              visible: user.type=='new',
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
                                    DriverData().approveCaptain(user,context)),)),
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
                                onYes: () =>
                                    DriverData().setpending(user,context)),),),
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
                                    DriverData().blockrequest(user,context)),)),
                    ],
                  )
                ],
              ),),
            Visibility(
              visible: user.type=='new',
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
                                    DriverData().approveCaptain(user,context)),)),
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
                                    DriverData().blockrequest(user,context)),)),
                    ],
                  )
                ],
              ),),
          ],
        ),
      ),
    ),
  );



}