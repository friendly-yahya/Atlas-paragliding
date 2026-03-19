import 'package:flutter/material.dart';
import 'package:atlas_paragliding/widgets/greeting_title.dart';
class PilotHomeScreen extends StatelessWidget {
  const PilotHomeScreen({super.key});

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
            title: GreetingTitle(name: "Mouad khouya", isOnline: true),
          ),
        ],
      ),
    );
  }
}