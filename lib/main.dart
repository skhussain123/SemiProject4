import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/Onboarding/onboardView.dart';
import 'package:tourism_app/admin_dashboard/admin.dart';
// import 'package:tourism_app/Onboarding/onboardView.dart';
import 'package:tourism_app/pages/Auth/login.dart';
// import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/pages/home.dart';
import 'package:tourism_app/provider/app_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainFile());
}

class MainFile extends StatelessWidget {
  const MainFile({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => LoginPage(),
          // '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
