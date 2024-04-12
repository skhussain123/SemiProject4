import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



//Function Get Screen Width
double getScreenWidth(BuildContext context){
 
 return MediaQuery.of(context).size.width;

}


//Function Get Screen Height
double getScreenHeight(BuildContext context){
 
 return MediaQuery.of(context).size.height;

}

//Function Navigation To Another Screen
void gotoPage(Widget page,BuildContext context){
Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
}


//Function Navigation To Another Screen and GetBack
void gotoPageandRemove(Widget page,BuildContext context){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>page,));
}


//Function Navigation To Another Screen and remove All other Screen
void gotoPageAndRemoveAll(Widget page,BuildContext context){
Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context)=>page,),(route)=>false);
}


displayMessage(String message,BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message))
  );


}