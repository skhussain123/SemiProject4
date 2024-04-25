import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController openingHoursController = TextEditingController();

  String selectedCity = 'Karachi'; // Default selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(text: 'Hotels'),
              Tab(text: 'Restaurants'),
              Tab(text: 'Attractions'),
            ],
          ),
          body: TabBarView(
            children: [
              _buildTabContent('hotels'),
              _buildTabContent('restaurants'),
              _buildTabContent('attractions'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String collection) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCity,
              items: ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi']
                  .map((city) => DropdownMenuItem(
                        child: Text(city),
                        value: city,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value!;
                });
              },
              decoration: InputDecoration(labelText: 'Select City'),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a rating';
                }
                return null;
              },
            ),
            TextFormField(
              controller: openingHoursController,
              decoration: InputDecoration(labelText: 'Opening Hours'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter opening hours';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addDataToFirestore(collection);
                }
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }

  void _addDataToFirestore(String collection) {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(selectedCity)
        .collection(collection)
        .add({
      'name': nameController.text,
      'description': descriptionController.text,
      'rating': ratingController.text,
      'opening-hours': openingHoursController.text,
      // Add other fields as needed
    }).then((value) {
      // Reset fields after successful submission
      nameController.clear();
      descriptionController.clear();
      ratingController.clear();
      openingHoursController.clear();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data added successfully')));
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to add data: $error')));
    });
  }
}
