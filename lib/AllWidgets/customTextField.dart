import 'package:flutter/material.dart';

TextField customTextField(String hint,TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: '$hint',
      contentPadding:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Color(0xFFc6520a), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Color(0xFFc6520a), width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    ),
    style: TextStyle(
      fontSize: 14.0,
    ),
  );
}