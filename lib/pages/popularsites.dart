import 'package:flutter/material.dart';

class PopularSitesPage extends StatelessWidget {
  const PopularSitesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 60, 68),
        title: Text(
          'Popular Sites',
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
            _buildPopularSiteItem(
              context,
              'Popular Site 1',
              'https://example.com/popular_site1.jpg', // Replace with actual image URL
              'Description of popular site 1...',
            ),
            SizedBox(height: 16.0),
            _buildPopularSiteItem(
              context,
              'Popular Site 2',
              'https://example.com/popular_site2.jpg', // Replace with actual image URL
              'Description of popular site 2...',
            ),
            SizedBox(height: 16.0),
            // Add more popular site items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildPopularSiteItem(
      BuildContext context, String name, String imageUrl, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
