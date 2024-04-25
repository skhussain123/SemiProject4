import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 60, 68),
        title: Text(
          'Hotels',
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
              'Islamabad Hotel',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              'images/islamabad-hotel.jpg', // Replace with actual image URL
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
              'Location: Blue Area - Islamabad',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Amenities:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Swimming Pool, Gym, Breakfast...',
              style: TextStyle(fontSize: 16),
            ),
            Divider(),

            Text(
              'Hotel Mehran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              'images/mehran-hotel.jpg', // Replace with actual image URL
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
              'Location: Saddar - Karachi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Amenities:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Swimming Pool, Gym, Breakfast...',
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            SizedBox(height: 16.0),
            Text(
              'Regent Plaza',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Image.asset(
              'images/regentplaza.jpg', // Replace with actual image URL
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_half, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                SizedBox(width: 8.0),
                Text('3.5 (150 Reviews)'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: Shahr e faisal - Karachi',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Amenities:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Gym, Swimming pool, Breakfast...',
              style: TextStyle(fontSize: 16),
            ),
            // Add more hotel data as needed
          ],
        ),
      ),
    );
  }
}
