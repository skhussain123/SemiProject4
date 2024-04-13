import 'package:flutter/material.dart';

class TourGuidePage extends StatelessWidget {
  const TourGuidePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Guide'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Guide Page',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButton<String>(
              hint: Text('Select City'),
              isExpanded: true,
              onChanged: (String? value) {
                // Handle dropdown value change
              },
              items: <String>['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
