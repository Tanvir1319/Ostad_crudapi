import 'package:flutter/material.dart';

const FormWhiteColor = Color(0xFFFAFAFA);
const EditIconColor = Color(0xFF00BCD4);
const CommonRedColor = Color(0xFFE53935);
const ToastSucess = Color(0xFF33691E);

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: child,
    ),
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 3,
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)));
}

Ink DangerButtonChild(ButtonText) {
  return Ink(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
      ),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductGrid() {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 3,
    mainAxisExtent: 400,
  );
}

