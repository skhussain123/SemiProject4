import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  
  String? hintText;
  IconData? prefixicon;
  TextEditingController? controller;

  CustomTextFields({
     this.hintText,
     this.controller,
     this.prefixicon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixicon),
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
