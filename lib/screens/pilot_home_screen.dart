import 'package:flutter/material.dart';

class PilotHomeScreen extends StatelessWidget {
  const PilotHomeScreen({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning,';
    if (hour < 17) return 'Good afternoon,';
    return 'Good evening,';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040713),
      body: CustomScrollView( 
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF040713),
            floating: true,
            snap: true,
            elevation: 0,
            titleSpacing: 20,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreeting(),
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.5),
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Moad khouya',
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}