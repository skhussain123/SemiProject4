import 'package:flutter/material.dart';

class SuccessAlert extends StatelessWidget {
 
 
  String tittle;
  VoidCallback onTap;
  String description;

  SuccessAlert(
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
