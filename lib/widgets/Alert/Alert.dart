import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
 
 
  String tittle;
  VoidCallback onTap;
  String description;

  CustomDialogBox(
      {required this.tittle, required this.onTap, required this.description});
  @override
 
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittle),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text('OK'),
        ),
      ],
    );
  }
}
