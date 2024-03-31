import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/constants/Fonts.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/pages/Auth/login.dart';
<<<<<<< HEAD
import 'package:tourism_app/utils/app_utils.dart';
=======
import 'package:tourism_app/provider/app_provider.dart';
import 'package:tourism_app/utils/app_utils.dart';
import 'package:tourism_app/widgets/buttons/custon_button.dart';
import 'package:tourism_app/widgets/textFields/confirmPassword.dart';
import 'package:tourism_app/widgets/textFields/custom_textField.dart';
import 'package:tourism_app/widgets/textFields/passwordFields.dart';
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4

class RegisterPage extends StatelessWidget {
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController Confirmpasswordcontroller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      appBar: AppBar(
<<<<<<< HEAD
        
        backgroundColor:AppColor.PrimaryColor,
=======
        backgroundColor: AppColor.PrimaryColor,
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
        title: Text(
          'Register Account',
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
<<<<<<< HEAD
        
        child: Column(
          children: [
            SizedBox(height: 70),
            
            
            //APP Center logo
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
            
            
            
            SizedBox(height: 70),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 25),
            SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),


            SizedBox(height: 25),
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

           TextButton(onPressed: (){
            gotoPage(LoginPage(), context);
           }, 
           
           child:  Text("are you already registered?",style: TextStyle(color: Colors.red),),),
           


            SizedBox(height: 25),
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
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),



          ],
=======
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),

              //APP Center logo
              Image.asset(
                'assets/images/appLogo.png',
                width: 90,
                height: 90,
              ),

              SizedBox(height: 10),

              Text(
                "Register Account City Guide",
                style: TextStyle(
                  fontSize: 18,
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

              

              Form(
                key: _formKey,
                child: Column(
                  children: [
                   
                    SizedBox(height: 25),

                    //User Name Fields
                    CustomTextFields(
                      hintText: "Enter Your Name",
                      prefixicon: FluentIcons.person_16_regular,
                      controller: Namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is Required";
                        }
                      },
                    ),

                    SizedBox(height: 20),
                    
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

                    SizedBox(height: 20),

                    //PAssword Fields
                    Consumer<AppNotifier>(
                      builder: (context, value, child) {
                        return PasswordFields(
                          hintText: "Enter Your Password",
                          prefixicon: FluentIcons.lock_closed_16_filled,
                          controller: passwordcontroller,
                          validator: (value) {
                           
                            if (value!.isEmpty) {
                              return "Phone number is Reqired";
                            } else if (value.length < 6) {
                              return "Password Should be Atleast 6 Character";
                            }


                          },
                          ObscureText: value.obscuretext,
                          onToggle: value.passwordToggle,
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    //Confirm PAssword Fields
                    Consumer<AppNotifier>(
                      builder: (context, value, child) {
                        return ConfirmPasswordFields(
                          hintText: "Enter Your Password",
                          prefixicon: FluentIcons.lock_closed_16_filled,
                          controller: Confirmpasswordcontroller,
                          validator: (value) {
                           
                            if (value!.isEmpty) {
                              return "Phone number is Reqired";
                            } else if (passwordcontroller != value) {
                              return "Password does not Match";
                            }
                          },

                          CObscureText: value.cobscuretext,
                          onToggle: value.ConfirlpasswordToggle,
                        );
                      },
                    ),
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
                        style: TextStyle(
                            color: AppColor.PrimaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),

              //Button here
              SizedBox(height: 25),
              CustomButton(
                tittle: "Register",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print("Form State is valid");
                  }
                },
                isLoading: false,
              ),
            ],
          ),
>>>>>>> 261f90d63f32bfc77dd1f372b50350f353f4c4e4
        ),
      ),
    );
  }
}
