import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/app_provider.dart';

class PasswordFields extends StatelessWidget {
  
  
  String? hintText;
  IconData? prefixicon;
  TextEditingController? controller;
  bool ObscureText;
  VoidCallback? onToggle;

  
  PasswordFields({
    this.hintText,
    this.controller,
    this.prefixicon,
    this.ObscureText = true,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      
      height: 50,

      //Password input Fields
      child: TextFormField(
        obscureText: ObscureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixicon),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(ObscureText ? FluentIcons.eye_12_regular : FluentIcons.eye_off_16_regular),
          ),
          labelText: hintText,
          border: OutlineInputBorder(),
        ),
      ),



    );


  }
}
