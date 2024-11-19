import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'superhero_screen.dart';
import 'villain_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState(); // Perbaikan nama state class
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SuperheroScreen(),
    const VillainScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Image.asset(
              'assets/marvel_logo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'Marvel Universe',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GNav(
          gap: 8,
          activeColor: Colors.red,
          color: Colors.grey,
          backgroundColor: Colors.black,
          tabBackgroundColor: Colors.red.withOpacity(0.2),
          padding: const EdgeInsets.all(12),
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.shield,
              text: 'Superhero',
            ),
            GButton(
              icon: Icons.dangerous,
              text: 'Villain',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
