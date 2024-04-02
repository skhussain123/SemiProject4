import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/Onboarding/onboardView.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/pages/home.dart';
import 'package:tourism_app/provider/app_provider.dart';

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
        // "/": (context) => Onboardingview(),
        //  "/": (context) => RegisterPage(),
        '/': (context) => HomePage(),
      },
    ),
    
    );
  }
}
