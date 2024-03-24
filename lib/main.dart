import 'package:flutter/material.dart';
import 'package:tourism_app/Onboarding/onboardView.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/pages/home.dart';

void main() {
  runApp(const MainFile());
}

class MainFile extends StatelessWidget {
  const MainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      initialRoute: "/",
      // home: SplaseScreen(),

      routes: {
        "/": (context) => Onboardingview(),
        //  "/": (context) => RegisterPage(),
        '/welcome': (context) => HomePage(),
      },
    );
  }
}
