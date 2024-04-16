import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomePageContent(),
    TourGuidePage(),
    // LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tour),
            label: 'Tour Guide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePageContent extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  const HomePageContent({Key? key, this.title, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 219, 215),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height:
                    150, // Adjust the height of the image container as needed
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      'assets/images/faisalMasjid.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Color.fromARGB(207, 7, 25, 72),
                      onPressed: () {
                        // Perform search action
                      },
                    ),
                    IconButton(
                      color: Color.fromARGB(207, 7, 25, 72),
                      icon: Icon(Icons.filter_alt),
                      onPressed: () {
                        // Open filters
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildCategoryColumn(Icons.location_city, 'Popular Sites'),
                  buildCategoryColumn(Icons.hotel, 'Hotels'),
                  buildCategoryColumn(Icons.beach_access, 'Beaches'),
                  buildCategoryColumn(Icons.landscape, 'Heritage Places'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Add border radius here
                          child: Image.asset(
                            'assets/images/islamabad.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Add border radius here
                          child: Image.asset(
                            'assets/images/karachi.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Add space between columns
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Add border radius here
                          child: Image.asset(
                            'assets/images/lahore.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              15), // Add border radius here
                          child: Image.asset(
                            'assets/images/faisalMasjid.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryColumn(IconData icon, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            padding: EdgeInsets.all(12),
            child: Icon(
              icon,
              size: 35,
              color: Color.fromARGB(71, 255, 4, 4),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}

class TourGuidePage extends StatefulWidget {
  const TourGuidePage({Key? key});

  @override
  _TourGuidePageState createState() => _TourGuidePageState();
}

class _TourGuidePageState extends State<TourGuidePage> {
  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(13),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 255, 254, 254),
              ),
            ),
            child: DropdownButton<String>(
              hint: Text('Select City'),
              isExpanded: true,
              value: _selectedCity,
              onChanged: (String? value) {
                setState(() {
                  _selectedCity = value;
                });
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
          if (_selectedCity != null) // Display selected city if available
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Selected City: $_selectedCity',
                style: TextStyle(fontSize: 20),
              ),
            ),
          // Add Row with two columns for hotels and beaches
          if (_selectedCity != null)
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Hotels',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Add hotel images
                      Image.asset(
                        'assets/images/lahore.png',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                        'assets/images/karachi.png',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Beaches',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Add beach images
                      Image.asset(
                        'assets/images/faisalMasjid.png',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                        'assets/images/islamabad.png',
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Login Page'),
//     );
//   }
// }
