import 'package:flutter/material.dart';
import 'package:tourism_app/firebase/auth/auth_service.dart';

class HeaderDrawer extends StatelessWidget {
   HeaderDrawer({super.key});

  AuthService _authService =AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(

            accountName: Text("Hussain"), 
            accountEmail: Text("HUssain123@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/faisalMasjid.png"),),
            ),
            decoration: BoxDecoration(
              
              image: DecorationImage(image: AssetImage("assets/images/faisalMasjid.png"),fit: BoxFit.cover)
            ),
            ),

            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text("Accounts"),
              onTap: ()=>print("uploaded Tabs"),
            ),


            ListTile(
              leading: Icon(Icons.home_repair_service),
              title: Text("Services"),
              onTap: ()=>print("uploaded Tabs"),
            ),


            ListTile(
              leading: Icon(Icons.place),
              title: Text("Places"),
              onTap: ()=>print("uploaded Tabs"),
            ),



            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: ()=>print("uploaded Tabs"),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){
                _authService.signout(context);
              }
            ),
            
            ]),
    );
  }

  
}

