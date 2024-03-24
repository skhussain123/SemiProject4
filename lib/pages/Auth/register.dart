import 'package:flutter/material.dart';
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor:AppColor.PrimaryColor,
        title: Center(
          child: Text(
            'Register Account',
            style: TextStyle(
              fontFamily: AppFonts.primaryFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      
      
      backgroundColor:Color.fromARGB(179, 241, 236, 236), // Change the background color of the body here
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          children: [
            SizedBox(height: 70),
            
            
            //Aoo Center logo
            Image.asset(
              'assets/images/appLogo.png', // Replace this with your app logo asset path
              width: 100,
              height: 100,
            ),
            
            
            SizedBox(height: 10),
           Text(
              "Welcome Back City Guide",
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
            
            
            
            SizedBox(height: 60),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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
                  'Registration',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
