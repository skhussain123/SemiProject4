import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/home.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot) {

        if(snapshot.hasData){
          
          return HomePage(); 
        }
        else{
          return LoginPage();
        }

      },
      
      );
  }
}