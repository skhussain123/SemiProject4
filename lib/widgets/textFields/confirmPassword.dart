import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/app_provider.dart';

class ConfirmPasswordFields extends StatelessWidget {
  
  
  String? hintText;
  IconData? prefixicon;
  TextEditingController? controller;
  bool CObscureText;
  VoidCallback? onToggle;

   String? Function(String? value)? validator;

  
  ConfirmPasswordFields({
    this.hintText,
    this.controller,
    this.prefixicon,
    this.CObscureText = true,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      
      height: 50,

      //Password input Fields
      child: TextFormField(
        obscureText: CObscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixicon),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(CObscureText ? FluentIcons.eye_12_regular : FluentIcons.eye_off_16_regular),
          ),
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
      ),



    );


  }
}
