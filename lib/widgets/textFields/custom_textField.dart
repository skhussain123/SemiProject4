import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  
  String? hintText;
  IconData? prefixicon;
  TextEditingController? controller;

  String? Function(String? value)? validator;

  CustomTextFields({
     this.hintText,
     this.controller,
     this.prefixicon,
     this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        validator: validator,
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
