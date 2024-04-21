import 'package:flutter/material.dart';

class BeachesPage extends StatelessWidget {
  const BeachesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 60, 68),
        title: Text('City Guide',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Text('Beaches'),
    );
  }
}
