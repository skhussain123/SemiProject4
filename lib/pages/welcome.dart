import 'package:flutter/material.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/images.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/utils/app_utils.dart';

class WelcomePAge extends StatelessWidget {
  const WelcomePAge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),

              // ILLustration
              Image.asset(
                Appimages.AppLogo,
                width: getScreenWidth(context) * 0.2,
              ),

              //Heading

              Text(
                "welcome City Guide",
                style: TextStyle(
                    fontSize: getScreenWidth(context) * 0.08,
                    color: AppColor.PrimaryColor,
                    fontWeight: FontWeight.bold),
              ),

              //Description

              Text(
                "The place Are You seeking for all your stuff ",
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.03,
                  color: AppColor.PrimaryColor,
                ),
              ),

              //Button
              Spacer(),

              //Get Started Button
              SizedBox(
                width: double.infinity,
                height: getScreenHeight(context) * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    gotoPage(RegisterPage(), context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.Color3, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Set border radius to 0 for no border radius
                    ),
                  ),
                  child: Text("Get Started",
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Already Account Button
              SizedBox(
                width: double.infinity,
                height: getScreenHeight(context) * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    gotoPage(LoginPage(), context);
                  },
                  style: ElevatedButton.styleFrom(
                    // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Set border radius to 0 for no border radius
                    ),
                  ),
                  child: Text("Already have Account",
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
