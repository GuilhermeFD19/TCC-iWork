import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color.fromARGB(255, 16, 69, 182);
  static const Color buttonColor = Color.fromARGB(255, 105, 165, 189);
  static const Color buttonTextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color backgroundColor = Color.fromARGB(255, 240, 159, 38);
  static const Color textColor = Color.fromARGB(255, 0, 0, 0);
}

class MyBorders {
  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColors.buttonColor,
      width: 4,
    ),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
