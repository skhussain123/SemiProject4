import 'package:flutter/material.dart';




class AppNotifier extends ChangeNotifier {
  
  // Password Toggle
  bool _obscureText = true;
  bool get obscuretext => _obscureText;

  void passwordToggle() {
    _obscureText = !_obscureText; 
    notifyListeners();
  }
}
