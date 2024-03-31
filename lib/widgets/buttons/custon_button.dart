import 'package:flutter/material.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/utils/app_utils.dart';

class CustomButton extends StatelessWidget {
  
  
  String tittle;
  VoidCallback onTap;
  bool isLoading;

  CustomButton({
  
  required this.tittle,
  required this.onTap,
  this.isLoading=false});



  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: getScreenHeight(context)*0.05,
      width: 130,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColor.PrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: isLoading? CircularProgressIndicator(color: AppColor.PrimaryColor,): Text(
          tittle,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );




  }
}
