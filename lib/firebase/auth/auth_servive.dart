import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/pages/home.dart';
import 'package:tourism_app/utils/app_utils.dart';
import 'package:tourism_app/widgets/buttons/Alert.dart';

class AuthService {


  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


//User Register Account Account Function Code here
  Future signup(String firstname, email, password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      await _db.collection('users').doc(user!.uid).set({
        'id': user.uid,
        'firstname': firstname,
        'email': email,
        'pasword': password,
        'isVerified': false,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            tittle: "Success",
            onTap: () {
              Navigator.of(context).pop();
            },
            description:
                'Account successfully Created',
          );
        },
      );
    } catch (error) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            tittle: "Alert",
            onTap: () {
              Navigator.of(context).pop();
            },
            description: 'Your Account has Been Already Created please Login',
          );
        },
      );
    }
  }


//User Login Account Function Code here
  Future signin(String email, password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = userCredential.user;

      await _db.collection('users').doc(user!.uid).update({
        'id': user.uid,
        'isVerified': true,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            tittle: "Login",
            onTap: () {
              Navigator.of(context).pop();
            },
            description: 'Your Account has Been Succfully Login ${user.email}',
          );
        },
      );

      gotoPageAndRemoveAll(HomePage(), context);
      
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            tittle: "Login Failed",
            onTap: () {
              Navigator.of(context).pop();
            },
            description: 'Invalid Credentials ${e.toString()}',
          );
        },
      );
    }
  }
}
