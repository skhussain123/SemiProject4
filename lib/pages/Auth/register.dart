import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/pages/Auth/login.dart';
import 'package:tourism_app/provider/app_provider.dart';
import 'package:tourism_app/utils/app_utils.dart';
import 'package:tourism_app/widgets/buttons/custon_button.dart';
import 'package:tourism_app/widgets/textFields/custom_textField.dart';
import 'package:tourism_app/widgets/textFields/passwordFields.dart';

class RegisterPage extends StatelessWidget {
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
        title: Text(
          'Register Account',
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      backgroundColor: Color.fromARGB(
          179, 241, 236, 236), 

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            SizedBox(height: 30),

            //APP Center logo
            Image.asset(
              'assets/images/appLogo.png',
              width: 100,
              height: 100,
            ),

            SizedBox(height: 10),

            
            //User Name Fields
            CustomTextFields(
              hintText: "Enter Your Name",
              prefixicon: FluentIcons.person_16_regular,
              controller: Namecontroller,
              
              ),




            SizedBox(height: 30),          

           Form(
              child: Column(
                
                children: [  
                  
                  CustomTextFields(
                    hintText: "Enter Email Address",
                    prefixicon: FluentIcons.mail_16_regular,
                    controller: emailcontroller,
                  ),

                  SizedBox(height: 35),
                  
                  
                  
                    //PAssword Fields
                 
                 Consumer<AppNotifier>(
                  builder:(context ,value,child){

                    return PasswordFields(
                    
                    hintText: "Enter Your Password",
                    prefixicon: FluentIcons.lock_closed_16_filled,
                    controller: passwordcontroller,
                    ObscureText: value.obscuretext,
                    onToggle: value.passwordToggle,
                  );
                  },),

                ],
              ), 
            ), 

  
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      gotoPage(LoginPage(), context);
                    },
                    child: Text(
                      "Are you already registered?",
                      style: TextStyle(color: AppColor.PrimaryColor,fontWeight: FontWeight.bold),
                    )),
              ],
            ),

           
           //Button here
            SizedBox(height: 25),
            CustomButton(
              tittle: "Register",
              onTap: () {},
            ),



          ],
        ),
      ),
    );
  }
}
