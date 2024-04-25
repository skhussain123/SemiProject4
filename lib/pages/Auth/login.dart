import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/admin_dashboard/admin.dart';
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/firebase/auth/auth_service.dart';
import 'package:tourism_app/pages/Auth/register.dart';
import 'package:tourism_app/provider/app_provider.dart';
import 'package:tourism_app/utils/app_utils.dart';
import 'package:tourism_app/widgets/buttons/custon_button.dart';
import 'package:tourism_app/widgets/textFields/custom_textField.dart';
import 'package:tourism_app/widgets/textFields/passwordFields.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Define local admin credentials
  final String adminEmail = 'admin@cityguide.com';
  final String adminPassword = 'admin123';

  AuthService _authService = AuthService();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
        title: Text(
          'Login Account',
          style: TextStyle(
            fontFamily: AppFonts.primaryFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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

            SizedBox(height: 30),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  ///Email Fields

                  CustomTextFields(
                    hintText: "Enter Email Address",
                    controller: emailController,
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
                          controller: passwordController,
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
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // Check if admin credentials
                  if (emailController.text == adminEmail &&
                      passwordController.text == adminPassword) {
                    // Navigate to admin page
                    gotoPage(AdminDashboard(), context);
                  } else {
                    // Proceed with regular user login
                    _authService.signin(
                        emailController.text, passwordController.text, context);
                  }
                }
              },
              tittle: 'Login',
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
    );
  }
}
