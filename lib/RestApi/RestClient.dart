import 'dart:convert';

import 'package:api/Screen/ProductCreateScreen.dart';
import 'package:api/Utility/Utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var PostHeader = {"Content-Type": "application/json"};
// Create Product Api data function

Future<bool> ProductCreateRequest(FormValues) async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL, headers: PostHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Successful Request has been sent");
    return true;
  } else {
    ErrorToast('Sorry! Request Failed . Try Again');
    return false;
  }
}

// Read Api data function

Future<List> ProductReadRequest() async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');

  var response = await http.get(URL, headers: PostHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Successful Request has been sent");
    return ResultBody['data'];
  } else {
    ErrorToast('Sorry! Request Failed . Try Again');
    return [];
  }
}

// Api :Delete function
Future<bool> ProductDeleteRequest(id) async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');

  var response = await http.get(URL, headers: PostHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Successful Request has been sent");
    return true;
  } else {
    ErrorToast('Sorry! Request Failed . Try Again');
    return false;
  }
}



// Update Product Api data function

Future<bool> ProductUpdateRequest(FormValues,id) async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct/'+id);
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL, headers: PostHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if (ResultCode == 200 && ResultBody['status'] == 'success') {
    SuccessToast("Successful Request has been sent");
    return true;
  } else {
    ErrorToast('Sorry! Request Failed . Try Again');
    return false;
  }
}