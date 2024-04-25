import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/pages/beaches.dart';
import 'package:tourism_app/pages/hotels.dart';
import 'package:tourism_app/pages/popularsites.dart';
import 'package:tourism_app/pages/userprofile.dart';

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
  ];

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(),
                  ),
                );
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
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildCategoryColumn(IconData icon, String title, Function() onTap) {
      return InkWell(
        onTap: onTap,
        child: Column(
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
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 219, 215),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Opacity(
                    opacity: 0.8,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 10 / 10,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                      ),
                      items: [
                        'assets/images/faisalMasjid.png',
                        'assets/images/karachi.png',
                        'assets/images/islamabad.png',
                        'assets/images/lahore.png',
                        'assets/images/faisalMasjid.png',
                        'assets/images/karachi.png',
                        'assets/images/islamabad.png',
                      ].map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              item,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
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
                  buildCategoryColumn(
                    Icons.hotel,
                    'Hotels',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HotelsPage(),
                        ),
                      );
                    },
                  ),
                  buildCategoryColumn(
                    Icons.beach_access,
                    'Beaches',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BeachesPage(),
                        ),
                      );
                    },
                  ),
                  buildCategoryColumn(
                    Icons.map,
                    'Popular Sites',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularSitesPage(),
                        ),
                      );
                    },
                  ),
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
                        Citycard(),
                        SizedBox(height: 12),
                        Text(
                          'Faisal Masjid',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        CityCard(),
                        SizedBox(height: 10),
                        Text(
                          'Mazar e Quaid',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10), // Add space between columns
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/lahore.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lahore',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/faisalMasjid.png',
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Faisal Masjid',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'assets/images/karachi.png',
        height: 100,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class Citycard extends StatelessWidget {
  const Citycard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'assets/images/islamabad.png',
        height: 100,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TourGuidePage extends StatefulWidget {
  const TourGuidePage({Key? key}) : super(key: key);

  @override
  _TourGuidePageState createState() => _TourGuidePageState();
}

class _TourGuidePageState extends State<TourGuidePage>
    with SingleTickerProviderStateMixin {
  String? _selectedCity;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
                'Results for : $_selectedCity',
                style: TextStyle(fontSize: 20),
              ),
            ),
          // Add TabBar and TabBarView for hotels and attractions
          if (_selectedCity != null)
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Hotels'),
                        Tab(text: 'Attractions'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Hotels Tab
                          _selectedCity == 'Karachi'
                              ? StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('cities')
                                      .doc('FfpJ60KyfFIpAHTGvP59')
                                      .collection('hotels')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error: ${snapshot.error}'),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.data!.docs.isEmpty) {
                                      return Center(
                                        child: Text(
                                            'No hotels found for $_selectedCity'),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          children: snapshot.data!.docs.map(
                                            (doc) {
                                              return Column(
                                                children: [
                                                  Text(
                                                    doc['name'],
                                                    style: TextStyle(
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  // Add hotel images
                                                  Image.network(
                                                    doc['image'],
                                                    height: 100,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('Ratings: '),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              140, 180, 250),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Text(
                                                          doc['rating'],
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10,
                                                                vertical: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              250, 140, 140),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Text(
                                                          'Opening hours:',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              10), // Add space between text and value
                                                      Text(
                                                        doc['opening-hours'],
                                                      ),
                                                    ],
                                                  ),

                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Description:',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width, // Adjust width as needed
                                                        child: Text(
                                                          doc['description'],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines:
                                                              2, // Adjust maxLines as needed
                                                          style: TextStyle(
                                                              // Add your preferred style here
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                      'No data available for $_selectedCity'),
                                ),
                          // Attractions Tab
                          _selectedCity == 'Karachi'
                              ? StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('cities')
                                      .doc('FfpJ60KyfFIpAHTGvP59')
                                      .collection('attractions')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error: ${snapshot.error}'),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.data!.docs.isEmpty) {
                                      return Center(
                                        child: Text(
                                            'No attractions found for $_selectedCity'),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          children: snapshot.data!.docs.map(
                                            (doc) {
                                              return Column(
                                                children: [
                                                  Text(
                                                    doc['name'],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  // Add attraction images
                                                  Image.network(
                                                    doc['image'],
                                                    height: 100,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Rating: ',
                                                      ),
                                                      Text(
                                                        doc['rating'],
                                                      ),
                                                    ],
                                                  ),

                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Opening hours: ',
                                                      ),
                                                      Text(
                                                        doc['opening-hours'],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                      'No data available for $_selectedCity'),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
