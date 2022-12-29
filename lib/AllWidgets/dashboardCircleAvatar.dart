import 'package:flutter/material.dart';
class customDetailsBoard extends StatelessWidget {

  customDetailsBoard({
    Key? key,
    required this.totalDrivers,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final int totalDrivers;
  VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: dashbox(
        value: "$totalDrivers",
        text: "$text",
      ),
    );
  }
}

class dashbox extends StatelessWidget {
  String value;
  String text;
  dashbox({Key? key, required this.value, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: CircleAvatar(
        backgroundColor: Color(0xFFc6520a),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$value",
              style: TextStyle(
                  fontFamily: "Brand-Bold",
                  fontSize: 50.0,
                  color: Colors.white),
            ),
            Text(
              "$text",
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontFamily: "Brand-Regular"),
            ),
          ],
        ),
      ),
    );
  }
}