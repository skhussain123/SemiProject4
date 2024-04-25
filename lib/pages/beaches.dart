import 'package:flutter/material.dart';

class BeachesPage extends StatelessWidget {
  const BeachesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 60, 68),
        title: Text(
          'Beaches',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        ),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hawksbay Beach',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              'images/hawksbay.png', // Replace with actual image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                SizedBox(width: 8.0),
                Text('4.0 (200 Reviews)'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: Karachi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: Popular beaches of Karachi, a beutiful and attraction for many years for the people of Karachi, it connects with the Arabian sea.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A short description of the beach...',
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            SizedBox(height: 16.0),
            Text(
              'Manora Beach',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              'images/manorabeach.png', // Replace with actual image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_half, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                SizedBox(width: 8.0),
                Text('3.5 (150 Reviews)'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: Karachi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: Popular beaches of Karachi, a beutiful and attraction for many years for the people of Karachi, it connects with the Arabian sea.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'A short description of the beach...',
              style: TextStyle(fontSize: 16),
            ),
            // Add more beach data as needed
          ],
        ),
      ),
    );
  }
}
