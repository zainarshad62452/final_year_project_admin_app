import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

customButton(String text, Function onTap,
    {Color? bgColor, Widget? icon, Color? textColor}) {
  return ElevatedButton(
    onPressed: () => onTap(),
    child: Row(
      mainAxisAlignment:
          icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  child: icon,
                ),
              )
            : SizedBox(),
        Text(
          text,
          style: TextStyle(fontSize: 14.0, color: textColor ?? Colors.white),
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
        fixedSize:Size(90.0, 60.7),
        shape: (RoundedRectangleBorder(
            side: BorderSide(
              width: 20.0,
              color: textColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(100.0)))),
  );
}

alignBlueTextButton(String text, Function onTap, {Alignment? alignment}) {
  return Align(
    alignment: alignment ?? Alignment.center,
    child: GestureDetector(
      onTap: () => onTap(),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue), //
        textAlign: TextAlign.center,
      ),
    ),
  );
}
