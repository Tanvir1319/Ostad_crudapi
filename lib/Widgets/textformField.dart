import 'package:api/Style/style.dart';
import 'package:flutter/material.dart';

InputDecoration FormInputDecoration(String hintText,Icon prefixIcon) {
  
  return InputDecoration( 
    
    focusColor: FormWhiteColor,
    hintText: hintText,
   prefixIcon: prefixIcon,
    filled: true,
    fillColor: FormWhiteColor,
    
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    )
  );
}