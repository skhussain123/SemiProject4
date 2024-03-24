import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/images.dart';
import 'package:tourism_app/pages/welcome.dart';
import 'package:tourism_app/utils/app_utils.dart';

class SplaseScreen extends StatefulWidget {
  const SplaseScreen({super.key});

  @override
  State<SplaseScreen> createState() => _SplaseScreenState();
}

class _SplaseScreenState extends State<SplaseScreen> {
  @override
  void initState() {
    super.initState();

    //Timer Function Redirect Welcome page After 3 second
    Timer(Duration(seconds: 2), () {
      gotoPageandRemove(WelcomePAge(), context);
  });
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      //Splase Screen Code Here

      body: Center(
          
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //--App logo
            SizedBox(
              height: 150,
            ),
            Image.asset(
              Appimages.AppLogo,
              width: getScreenHeight(context) * 0.2,
            ),


            Text(
              "City Guide",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColor.PrimaryColor,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),



          ],
        ),
        
      ),
    );




  }
}
