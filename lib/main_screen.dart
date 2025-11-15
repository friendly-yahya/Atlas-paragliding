// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'screens/flight_screen.dart';
import 'screens/home_screen.dart';
import 'screens/messaging_screen.dart';
import 'screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  
  // ignore: prefer_final_fields
  int _selectedIndex = 0;

  // ignore: unused_field
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildNavigator(0, const HomeScreen()),
          _buildNavigator(1, const MessagingScreen()),
          _buildNavigator(2, const FlightScreen()),
          _buildNavigator(3, const ProfileScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paragliding_rounded),
            label: 'flights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
          
        ],
      ),
    );
  }
  // This method handles tab taps
  void _onTabTapped(int index) {
    // If user taps the same tab they're on, pop to the first screen of that tab
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      // Otherwise, switch to the tapped tab
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  // This creates a separate Navigator for each tab
  Widget _buildNavigator(int index, Widget child){
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }

}
