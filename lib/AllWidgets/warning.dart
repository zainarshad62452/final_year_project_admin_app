import 'package:buraq_admin/DataHandler/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

WarningDialog(
    {required BuildContext context,
    required String title,
    required Function onYes}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 250.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.0),
              Center(
                child: Text(
                  "Alert",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500,fontFamily: "Brand-Bold",),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("$title", textAlign: TextAlign.center,style: TextStyle(fontFamily: "Brand-Regular",color: Colors.black),),
              ),
              Spacer(),
              Divider(color: Colors.black),
              Container(
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Center(
                        child: Text(
                          "No",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.orange,
                              fontFamily: "Brand-Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    VerticalDivider(color: Colors.black),
                    SizedBox(width: 50.0,),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        onYes();
                      },
                      child: Center(
                        child: Text(
                          "Yes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Brand-Regular",
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
