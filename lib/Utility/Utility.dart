import 'package:api/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void SuccessToast(msg){
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ToastSucess,
        textColor: FormWhiteColor,
        fontSize: 16.0
    );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: CommonRedColor,
        textColor: FormWhiteColor,
        fontSize: 16.0
    );
}