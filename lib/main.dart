import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/Onboarding/onboardView.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/pages/home.dart';
<<<<<<< HEAD
=======
import 'package:tourism_app/provider/app_provider.dart';
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4

void main() {
  runApp(const MainFile());
}

class MainFile extends StatelessWidget {
  const MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return ChangeNotifierProvider(
      create: (context)=>AppNotifier(),
      
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      routes: {
<<<<<<< HEAD
        "/": (context) => Onboardingview(),
        //  "/": (context) => RegisterPage(),
=======
        // "/": (context) => Onboardingview(),
         "/": (context) => RegisterPage(),
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
        '/welcome': (context) => HomePage(),
      },
    ),
    
    );
  }
}
