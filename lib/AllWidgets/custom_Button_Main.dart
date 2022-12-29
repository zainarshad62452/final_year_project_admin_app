import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customButtonMain extends StatelessWidget {

  String text;
  VoidCallback onPressed;

  customButtonMain({
    Key? key,required this.text,required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Color(0xFFc6520a),
    textColor: Colors.white,
    child: Container(
    height: 50.0,
    child: Center(
    child: Text(
    "$text",
    style: TextStyle(
    fontSize: 18.0,
    fontFamily: "Brand-Bold",
    ),
    ),
    ),
    ),
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(24.0),
    ),
    );
  }
}