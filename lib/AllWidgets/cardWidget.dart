import 'package:buraq_admin/DataHandler/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    Key? key,
    required this.text,
    required this.drivers,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final RxInt drivers;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Card(
            color: kCardColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
// shadowColor: Color(0xFFc6520a),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text("$text",style: TextStyle(fontFamily: "Brand-Regular"),),
                    leading: Icon(Icons.person),
                  ),
                  Center(
                    child: Text("$drivers",style: TextStyle(fontSize: 55.0,fontFamily: "Brand-Bold"),),
                  ),
                  ListTile(
                    title: Text("Active",style: TextStyle(fontFamily: "Brand-Regular"),),
                    trailing: Text("0",style: TextStyle(fontFamily: "Brand-Bold",fontSize: 25.0),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

