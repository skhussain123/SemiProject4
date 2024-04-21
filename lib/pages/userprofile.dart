import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('profile page'),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 1, 171),
        title: Text('City Guide',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              // bottom: Radius.circular(5), // Adjust the radius as needed
              ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
