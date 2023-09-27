import 'package:flutter/material.dart';
import 'package:iwork_project/_comum/color_base.dart';

InputDecoration GetAuthenticationInputDecoration(String Label) {
  return InputDecoration(
    hintText: Label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: MyColors.buttonColor,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
