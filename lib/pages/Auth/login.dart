import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/utils/app_utils.dart';
=======
import 'package:provider/provider.dart';
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/provider/app_provider.dart';
import 'package:tourism_app/utils/app_utils.dart';
import 'package:tourism_app/widgets/buttons/custon_button.dart';
import 'package:tourism_app/widgets/textFields/custom_textField.dart';
import 'package:tourism_app/widgets/textFields/passwordFields.dart';
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4

class LoginPage extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD

        appBar: AppBar(
        
        backgroundColor:AppColor.PrimaryColor,
=======
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
        title: Text(
          'Login Account',
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
<<<<<<< HEAD
        iconTheme: IconThemeData(color: Colors.white), 
      ),




         
      backgroundColor:Color.fromARGB(179, 241, 236, 236), // Change the background color of the body here
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          children: [
            SizedBox(height: 100),
            
            
            //APP Center logo
            Image.asset(
              'assets/images/appLogo.png', // Replace this with your app logo asset path
              width: 100,
              height: 100,
            ),
            
            
            SizedBox(height: 15),
           Text(
=======
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(179, 241, 236, 236),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 25),

            //APP Center logo
            Image.asset(
              'assets/images/appLogo.png',
              width: 100,
              height: 100,
            ),

            SizedBox(height: 15),

            Text(
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
              "Login Your Account",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: AppColor.PrimaryColor,
                fontFamily: AppFonts.primaryFont,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.7), // Shadow color
                    offset: Offset(5, 5), // Shadow offset
                    blurRadius: 8, // Shadow blur radius
                  ),
                ],
              ),
            ),
<<<<<<< HEAD
            
            
            
            SizedBox(height: 50),
         
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),


            SizedBox(height: 35),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),



            SizedBox(height: 35),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColor.PrimaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),


                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),



          ],
        ),
      ),


=======

            SizedBox(height: 30),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  ///Email Fields

                  CustomTextFields(
                    hintText: "Enter Email Address",
                    prefixicon: FluentIcons.mail_16_regular,
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is Required";
                      } else if (!value.contains('@') ||
                          !value.contains('.com')) {
                        return "Please Enter a Valid Email Address";
                      }
                    },
                  ),

                  SizedBox(height: 35),

                  //PAssword Fields

                  Consumer<AppNotifier>(
                    builder: (context, value, child) {
                      return PasswordFields(
                          hintText: "Enter Your Password",
                          prefixicon: FluentIcons.lock_closed_16_filled,
                          controller: passwordcontroller,
                          ObscureText: value.obscuretext,
                          onToggle: value.passwordToggle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone number is Reqired";
                            } else if (value.length < 6) {
                              return "Password Should be Atleast 6 Character";
                            }
                          });
                    },
                  ),
                ],
              ),
            ),

            //Login Button
            SizedBox(height: getScreenHeight(context) * 0.05),

            CustomButton(
              tittle: "Login",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print("Form State is Valid");
                }
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    endIndent: 60,
                    indent: 10,
                  ),
                ),
                SizedBox(height: getScreenHeight(context) * 0.05),
                Text("Or Continue With "),
                Flexible(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    endIndent: 60,
                    indent: 10,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an Account"),
                TextButton(
                  onPressed: () {
                    gotoPage(RegisterPage(), context);
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(
                        color: AppColor.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
    );
  }
}
