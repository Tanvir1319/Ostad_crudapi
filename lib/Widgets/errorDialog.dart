import 'package:api/Style/style.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;
  ErrorDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
        content:Text(message!),
      
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Center(child: Text("Ok"),),
            style: ElevatedButton.styleFrom(
              backgroundColor: CommonRedColor,
            ),
            ),
      ],
      
    );
  }
}
